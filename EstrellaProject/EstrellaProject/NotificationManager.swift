//
//  NotificationManager.swift
//  EstrellaProject
//
//  Created by Olha Dzhyhirei on 4/25/23.
//

import SwiftUI
import UserNotifications

class NotificationManager {
    
    @AppStorage ("wasAsked") var wasAsked = false
    static let shared = NotificationManager()
    
    func requestAuthorization(completion: @escaping () -> Void) {
        if !wasAsked {
            let options: UNAuthorizationOptions = [.alert, .sound, .badge]
            
            UNUserNotificationCenter.current().requestAuthorization(options: options) { (succes, error) in
                if let error = error {
                    print(error.localizedDescription)
                }
                self.wasAsked = true
            }
        } else {
            UNUserNotificationCenter.current().getNotificationSettings { settings in
                if settings.authorizationStatus != .authorized {
                    DispatchQueue.main.async {
                        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
                    }
                }
            }
        }
        completion()
    }
    
    func scheduleNotification(for activity: Activity) {
        let content = UNMutableNotificationContent()
        let currentBadgeNumber = UIApplication.shared.applicationIconBadgeNumber + 1
        
        content.title = "Scheduled task for today: "
        content.subtitle = activity.name
        content.sound = .default
        content.badge = NSNumber(value: currentBadgeNumber)
        
        let calendar = Calendar.current
        var dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: activity.date)
        dateComponents.hour = 7
        dateComponents.minute = 1
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: activity.id.uuidString,
                                            content: content,
                                            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func isActive() -> Bool {
        var active = false
        let semaphore = DispatchSemaphore(value: 0)
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                active = true
            } else {
                active = false
            }
            semaphore.signal()
        }
        semaphore.wait()
        return active
    }
    
    func removeScheduledNotifications(for activities: [Activity]) {
        let identifiers = activities.map { $0.id.uuidString }
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: identifiers)
    }
    
    func removeBadg() {
        UIApplication.shared.applicationIconBadgeNumber = 0
    }

}

class MyNotificationObserver: NSObject {
    
    var action: ()->()
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    
    @objc func performAction() {
        self.action()
    }
}
