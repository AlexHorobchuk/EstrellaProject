//
//  Model.swift
//  EstrellaProject
//
//  Created by Olha Dzhyhirei on 4/23/23.
//
import CoreData
import SwiftUI

class Storage: ObservableObject {
    let container = NSPersistentContainer(name: "Storage")
    @Published var savedActivities : [Activity] = []
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("CoreData failed to load: \(error.localizedDescription)")
            }
        }
        fetchActivities()
    }
    
    func fetchActivities() {
        
        let request = NSFetchRequest<ActivityEntity>(entityName: "ActivityEntity")
        do {
            let tasks = try container.viewContext.fetch(request)
            savedActivities = tasks.compactMap { task -> Activity? in
                guard let id = task.id,
                      let name = task.name,
                      let date = task.date  else {
                    return nil
                }
                let activity = Activity(id: id, name: name, date: date, importance: Int(task.importance), urgency: Int(task.urgency))
                return activity
            }
        } catch let error {
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    func addActivity(activity: Activity) {
        let newActivity = ActivityEntity(context: container.viewContext)
        newActivity.name = activity.name
        newActivity.date = activity.date
        newActivity.importance = Int64(activity.importance)
        newActivity.urgency = Int64(activity.urgency)
        newActivity.id = activity.id
        saveData()
        fetchActivities()
    }
    
    func saveData() {
        do {
            try  container.viewContext.save()
        } catch let error {
            print("Couldt save to CoreData: \(error.localizedDescription)")
        }
    }
    
    func deleteActivity(activity: [Activity]) {
        let request = NSFetchRequest<ActivityEntity>(entityName: "ActivityEntity")
        activity.forEach { activity in
            request.predicate = NSPredicate(format: "id == %@", activity.id as CVarArg)
            
            do {
                let results = try container.viewContext.fetch(request)
                if let task = results.first {
                    container.viewContext.delete(task)
                    saveData()
                }
            } catch let error {
                print("Error deleting: \(error.localizedDescription)")
            }
        }
        fetchActivities()
    }
}

class Schedule: ObservableObject {
    var description = Description()
    var storage: Storage
    init(storage: Storage) {
        self.storage = storage
    }
    
    func isEmpty(imporatnce: Int, urgency: Int) -> Bool {
        return getActivitisFor(imporatnce: imporatnce, urgency: urgency).isEmpty
    }
    
    func getActivitisFor(imporatnce: Int, urgency: Int) -> [Activity] {
        let activities = storage.savedActivities.filter { $0.importance == imporatnce && $0.urgency == urgency }
        let sortedActivities = activities.sorted {
            let date1 = Calendar.current.startOfDay(for: $0.date)
            let date2 = Calendar.current.startOfDay(for: $1.date)
            
            if date1 != date2 {
                return date1 < date2
            } else {
                return $0.name < $1.name
            }
        }
        return sortedActivities
    }
    
    func deleteActivities(activities: [Activity]) {
        if !activities.isEmpty {
            storage.deleteActivity(activity: activities)
            NotificationManager.shared.removeScheduledNotifications(for: activities)
        }
    }
    
    func isToday(activities: [Activity]) -> Bool {
        let today = Calendar.current.startOfDay(for: Date())
        let allDays = activities.map { Calendar.current.startOfDay(for: $0.date) }
        return allDays.contains(where: { $0 == today || $0 < today })
    }
    
}

struct Description {
    var minImportance = 1
    var maxImportance = 5
    var minUrgency = 1
    var maxUrgency = 5
}

struct Activity: Identifiable, Equatable {
    
    var id: UUID
    var name: String
    var date: Date
    var importance: Int
    var urgency: Int
    
}

class ActivityVM: ObservableObject {
   @Published var activity: Activity
    var description = Description()
    
    init() {
        activity = Activity(id: UUID(), name: "", date: Date(), importance: 3, urgency: 3)
    }
}

enum DescriptionType {
    case urgency, importancy
}
