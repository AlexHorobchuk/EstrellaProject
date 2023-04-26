//
//  LogoAndGoBack.swift
//  EstrellaProject
//
//  Created by Olha Dzhyhirei on 4/19/23.
//

import SwiftUI

struct LogoAndGoBack: View {
    
    var action: (()->())?
    
    var body: some View {
        HStack {
            
            Button(action: { if let action {
                action()
            } },
                   label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                
            })
            .frame(width: 60)
            .padding(.horizontal, 9)
            
            Image("logo 1")
                .resizable()
                .scaledToFit()
                .frame(width: 230)
                .padding(.horizontal)
            
            Spacer()
        }
    }
}

struct LogoAndGoBack_Previews: PreviewProvider {
    static var previews: some View {
        LogoAndGoBack()
    }
}
