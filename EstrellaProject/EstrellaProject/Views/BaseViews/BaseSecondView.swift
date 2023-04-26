//
//  BaseSecondView.swift
//  EstrellaProject
//
//  Created by Olha Dzhyhirei on 4/20/23.
//

import SwiftUI

struct BaseSecondView<Content: View> : View {
    
    var buttonText: String
    var popView: (()->())?
    var buttonAction: (()->())?
    var content: () -> Content
    
    var body: some View {
        VStack {
            LogoAndGoBack(action: { popView?() })
                .padding(.top, 90)
            
            
            ZStack {
                BGRect()
                
                content()
            }
            .frame(width: 350, height: 350)
            .padding(.top, 50)
            
            Button(action: { buttonAction?() },
                   label: { Text(buttonText)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .font(.system(size: 22))
            })
            .frame(width: 220, height: 50)
            .background(Color("buttonYellow"))
            .clipShape(Capsule())
            .shadow(color: .white, radius: 5)
            .padding(.top, 70)
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("main"))
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
    }
}
