//
//  TextAndArrow.swift
//  EstrellaProject
//
//  Created by Olha Dzhyhirei on 4/24/23.
//

import SwiftUI

struct ImportantTextAndArrow: View {
    var body: some View {
        HStack {
            Image("arrow 2")
                .resizable()
                .scaledToFit()
                .padding(.leading)
            
            Text("Important")
                .lineLimit(1)
                .foregroundColor(.white)
                .fixedSize()
                .padding(.horizontal)
            
            Image("arrow 1")
                .resizable()
                .scaledToFit()
                .padding(.trailing)
        }
        .frame(width: 350)
    }
}

struct UrgentTextAndArrow: View {
    var body: some View {
        VStack {
            
            Image("arrow 4")
                .resizable()
                .scaledToFit()
                .padding(.bottom)
            
            Text("Urgent")
                .foregroundColor(.white)
                .rotationEffect(Angle(degrees: 90))
                .lineLimit(1)
                .fixedSize()
                .padding(.vertical, 20)
            
            Image("arrow 3")
                .resizable()
                .scaledToFit()
                .padding(.top)
            
        }
        .frame(width: 5.7,height: 350)
        
    }
}
