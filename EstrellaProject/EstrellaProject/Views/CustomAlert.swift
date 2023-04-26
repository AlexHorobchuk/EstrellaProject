//
//  Alert.swift
//  EstrellaProject
//
//  Created by Olha Dzhyhirei on 4/23/23.
//

import SwiftUI

struct CustomAlert: View {
    @Binding var isShowing: Bool
    var title: String
    var action: (()->())?
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(title)
                .foregroundColor(.white)
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .lineLimit(nil)
                .multilineTextAlignment(.center)
                .padding(20)
            
            Spacer()
            
            
            Button(action: {
                action?()
                isShowing = false
            },
                   label: { Text("DONE")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .font(.system(size: 22))
            })
            .frame(width: 120, height: 50)
            .background(Color("buttonYellow"))
            .clipShape(Capsule())
            .shadow(color: .white, radius: 5)
            
            Spacer()
        }
        .frame(maxWidth: UIScreen.main.bounds.width * 0.65, maxHeight: UIScreen.main.bounds.height * 0.4)
        .background(Color("main"))
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .ignoresSafeArea(edges: .top)
        .padding()
    }
}
