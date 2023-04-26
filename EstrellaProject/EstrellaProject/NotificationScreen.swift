//
//  ContentView.swift
//  EstrellaProject
//
//  Created by Olha Dzhyhirei on 4/18/23.
//

import SwiftUI

struct NotificationView: View {
    
    var notificationModel = NotificationModel()
    
    var body: some View {
        VStack {
            Image("logo 1")
                .resizable()
                .scaledToFit()
                .frame(width: 250)
                .padding(.top, 200)
                .padding(.bottom, 100)
            
            Text(notificationModel.mainText)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .font(.system(size: 19))
                .frame(width: UIScreen.main.bounds.width * 0.635)
                .padding(.bottom, 100)
            
            Button(action: {},
                   label: { Text("ALLOW")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .font(.system(size: 22))
            })
            .frame(width: 180, height: 50)
            .background(Color("buttonYellow"))
            .clipShape(Capsule())
            .shadow(color: .white, radius: 5)
            .padding(.bottom, 120)
            
            Button(action: {},
                   label: { Text("NEXT TIME")
                    .foregroundColor(.white)
                    .font(.system(size: 19))
                    .underline()
            })
            .frame(width: 120, height: 50)
            
            
            
            Spacer()
        }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color("main"))
    .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
