//
//  ActivitiesPopOver.swift
//  EstrellaProject
//
//  Created by Olha Dzhyhirei on 4/25/23.
//

import SwiftUI


struct ActivitiesPopOver: View {
    @ObservedObject var viewModal: Schedule
    var activities: [Activity]
    @State var activitiesForDeleting: [Activity] = []
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(activities) { activity in
                    HStack {
                        Image(systemName: activitiesForDeleting.contains(where: { $0 == activity}) ? "checkmark.circle" : "circle")
                        
                        /*@START_MENU_TOKEN@*/Text(activity.name)/*@END_MENU_TOKEN@*/
                            .lineLimit(2)
                        
                        Spacer()
                        
                        Text(activity.date, style: .date)
                            .lineLimit(1)
                            .fixedSize()
                        
                    }
                    .padding(5)
                    .onTapGesture {
                        if activitiesForDeleting.contains(where: { $0 == activity }) {
                            activitiesForDeleting.removeAll(where: { $0 == activity })
                        } else {
                            activitiesForDeleting.append(activity)
                        }
                    }
                }
            }
        }
        .foregroundColor(Color.white)
        .background(Color("tableTop"))
        .frame(width: 250, height: 300)
        .onDisappear {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                    viewModal.deleteActivities(activities: activitiesForDeleting)
                
            }
        }
    }
}

struct ActivitiesPopover_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesPopOver( viewModal: Schedule(storage: Storage()), activities: [Activity(id: UUID(), name: "Hello", date: Date(), importance: 3, urgency: 3),
                                       Activity(id: UUID(), name: "Bring water", date: Date(), importance: 3, urgency: 3),
                                       Activity(id: UUID(), name: "Do shopping of product", date: Date(), importance: 3, urgency: 3),
                                       Activity(id: UUID(), name: "Wash dishes", date: Date(), importance: 3, urgency: 3)])
    }
}
