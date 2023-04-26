//
//  BaseFirstView.swift
//  EstrellaProject
//
//  Created by Olha Dzhyhirei on 4/20/23.
//

import SwiftUI

struct BaseFirstView<Content: View> : View {
    
    var content: () -> Content
    
    var body: some View {
        
        VStack {
            Image("logo 1")
                .resizable()
                .scaledToFit()
                .frame(width: 230)
                .padding(.top, 90)
            
            content()
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("main"))
        .ignoresSafeArea()
    }
}
