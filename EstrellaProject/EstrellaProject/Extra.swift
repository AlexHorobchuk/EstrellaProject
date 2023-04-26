//
//  Extra.swift
//  EstrellaProject
//
//  Created by Olha Dzhyhirei on 4/18/23.
//

import Foundation

struct NotificationModel {
    var mainText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation"
}

enum AlertItem {
    case saved, nameIsEmpty
    
    func getText() -> String {
        switch self {
            
        case .saved:
            return "Your activity was successfully saved"
            
        case .nameIsEmpty:
            return "Please enter the name for activity"
        }
    }
}

class NavigationHelper: ObservableObject {
    @Published var showNextView = false
}
