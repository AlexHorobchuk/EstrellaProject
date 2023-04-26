//
//  TabViewGenerator.swift
//  EstrellaProject
//
//  Created by Olha Dzhyhirei on 4/19/23.
//

import SwiftUI

enum TabViewGenerator: Int, CaseIterable {
    case newActiviteView , scheduleView , settingsView
    
    func getImageName() -> String {
        switch self {
        case .newActiviteView:
            return "list"
        case .scheduleView:
            return "dashboard"
        case .settingsView:
            return "filter"
        }
    }
    
    @ViewBuilder
    func getView(storage: Storage) -> some View {
        switch self {
        case .newActiviteView:
            NewActivityView()
        case .scheduleView:
            ScheduleView(viewModel: Schedule(storage: storage))
        case .settingsView:
            SettingsView()
        }
    }
}
