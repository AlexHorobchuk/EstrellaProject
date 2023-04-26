//
//  SettingsView.swift
//  EstrellaProject
//
//  Created by Olha Dzhyhirei on 4/19/23.
//

import SwiftUI

struct SettingsView: View {
    
    var body: some View {
        BaseFirstView() {
            VStack(spacing: 50) {
                
                Link(destination: URL(string: "https://www.apple.com")!,
                     label: { Text("PRIVACY POLICY")
                        .foregroundColor(.white)
                        .font(.system(size: 22))
                        .fontWeight(.semibold)
                        .underline()
                        
                })
                
                Link(destination: URL(string: "https://www.apple.com")!,
                     label: { Text("TERMS OF USE")
                        .foregroundColor(.white)
                        .font(.system(size: 22))
                        .fontWeight(.semibold)
                        .underline()
                })
                
                Spacer()
            }
            .padding(.top, 150)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
