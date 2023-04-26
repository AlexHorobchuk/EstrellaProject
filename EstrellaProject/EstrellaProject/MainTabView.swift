//
//  TabView.swift
//  EstrellaProject
//
//  Created by Olha Dzhyhirei on 4/18/23.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var navigationHelper = NavigationHelper()
    @StateObject var storage = Storage()
    @State var tabViewSelection = 0
    let notificationObserver = MyNotificationObserver(action: NotificationManager.shared.removeBadg)
    
    init() {
            NotificationCenter.default.addObserver(notificationObserver, selector: #selector(MyNotificationObserver.performAction), name: UIApplication.willResignActiveNotification, object: nil)
        }
    
    var body: some View {
        
        TabView(selection: $tabViewSelection) {
            
            ForEach(TabViewGenerator.allCases, id: \.self) { tab in
                tab.getView(storage: storage)
                    .tabItem {
                        ScaledImage(active: tabViewSelection == tab.rawValue, name: tab.getImageName())
                    }.tag(tab.rawValue)
                    .environmentObject(navigationHelper)
                    .environmentObject(storage)
            }
        }
        .accentColor(.white)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
