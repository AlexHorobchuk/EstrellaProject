//
//  NASaveView.swift
//  EstrellaProject
//
//  Created by Olha Dzhyhirei on 4/20/23.
//

import SwiftUI

struct NASaveView: View {
    @EnvironmentObject var storage: Storage
    @EnvironmentObject var navigationHelper: NavigationHelper
    @Binding var popView: Bool
    @ObservedObject var viewModel: ActivityVM
    @State var isSaved = false
    
    var body: some View {
        BaseSecondView(buttonText: "CONFIRM",
                       popView: { popView = false },
                       buttonAction: {
            storage.addActivity(activity: viewModel.activity)
            NotificationManager.shared.scheduleNotification(for: viewModel.activity)
            isSaved = true
        }) {
            VStack {
                
                Text("\(viewModel.activity.name)")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .font(.system(size: 22))
                    .lineLimit(3)
                    .padding()
                
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(.white)
                        .font(.system(size: 26))
                    
                    Text("Deadline")
                        .foregroundColor(.white)
                        .font(.system(size: 19))
                    
                    
                    
                    Text(viewModel.activity.date, style: .date)
                        .foregroundColor(.white)
                        .font(.system(size: 19))
                }
                .fullScreenCover(isPresented: $isSaved) {
                    CustomAlert(isShowing: $isSaved,
                                title: AlertItem.getText(.saved)(),
                                action: { navigationHelper.showNextView = false }).clearModalBackground()
                }
                
                Image("star")
                    .resizable()
                    .scaledToFit()
            }
            .padding(35)
        }
    }
}

struct NASaveView_Previews: PreviewProvider {
    static var previews: some View {
        NASaveView(popView: .constant(true), viewModel: ActivityVM())
    }
}
