//
//  ScheduleView.swift
//  EstrellaProject
//
//  Created by Olha Dzhyhirei on 4/18/23.
//

import SwiftUI

struct ScheduleView: View {
    @EnvironmentObject var storage: Storage
    @StateObject var viewModel: Schedule
    
    @State var tappedActivities: [Activity] = []
    
    
    var body: some View {
        BaseFirstView() {
            VStack {
                if storage.savedActivities.isEmpty {
                    Image("img 2")
                        .resizable()
                        .scaledToFit()
                    
                    Text("You dont have activities yet")
                        .foregroundColor(.white)
                        .font(.system(size: 22))
                        .padding(.vertical)
                } else {
                    
                    ImportantTextAndArrow()
                        .padding(.horizontal)
                        .padding(.top, 50)
                    
                    HStack {
                        ZStack {
                            BGRect()
                            VStack {
                                
                                Numiration(description: viewModel.description, type: .importancy)
                                
                                HStack {
                                    HStack {
                                        ForEach(viewModel.description.minImportance...viewModel.description.maxImportance,
                                                id: \.self) { importance in
                                            VStack {
                                                ForEach(viewModel.description.minUrgency...viewModel.description.maxUrgency,
                                                        id: \.self) { urgency in
                                                    let activities = viewModel.getActivitisFor(imporatnce: importance, urgency: urgency)
                                                    ZStack {
                                                        RoundedRectangle(cornerRadius: 15)
                                                            .fill(activities.isEmpty ? Color("boardEmpty") : Color("boardFill"))
                                                            .overlay(
                                                                viewModel.isToday(activities: activities) ? RoundedRectangle(cornerRadius: 15)
                                                                    .stroke(Color.red, lineWidth: 1)
                                                                : nil
                                                            )
                                                        if !activities.isEmpty {
                                                            
                                                            HStack {
                                                                Image("list")
                                                                    .resizable()
                                                                    .scaledToFit()
                                                                    .frame(width: 20, height: 20)
                                                                
                                                                Text("\(activities.count)")
                                                                    .font(.system(size: 15))
                                                                    .foregroundColor(.white)
                                                            }
                                                        }
                                                    }
                                                    .frame(width: 55, height: 55)
                                                    .onTapGesture {
                                                        if !activities.isEmpty {
                                                            tappedActivities = activities
                                                        }
                                                    }
                                                    .alwaysPopover(isPresented: Binding(
                                                        get: { tappedActivities == activities && !tappedActivities.isEmpty},
                                                        set: { _ in tappedActivities = [] }
                                                    ), content: {
                                                        ActivitiesPopOver(viewModal: viewModel, activities: activities)
                                                    })
                                                }
                                            }
                                        }
                                    }
                                    .padding(.leading)
                                    .padding(.bottom)
                                    
                                    Numiration(description: viewModel.description, type: .urgency)
                                }
                            }
                        }
                        .frame(width: 350, height: 350)
                        
                        UrgentTextAndArrow()
                            .padding(.leading,5)
                    }
                    .padding(.leading, 15)
                }
            }
            .padding(30)
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView( viewModel: Schedule(storage: Storage()))
    }
}
