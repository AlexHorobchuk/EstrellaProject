//
//  EstrellaProjectApp.swift
//  EstrellaProject
//
//  Created by Olha Dzhyhirei on 4/18/23.
//

import SwiftUI

@main
struct EstrellaProjectApp: App {
    
    var body: some Scene {
        WindowGroup {
            if !NotificationManager.shared.isActive() {
                NotificationView()
            } else {
                MainTabView()
            }
        }
    }
}
