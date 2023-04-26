//
//  DatePopOver.swift
//  EstrellaProject
//
//  Created by Olha Dzhyhirei on 4/22/23.
//

import SwiftUI

struct DatePopover: View {

    @Binding var dateIn: Date
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack {
            DatePicker("",
                       selection: $dateIn,
                       in: Date()...,
                       displayedComponents: .date)
            .datePickerStyle(.graphical)
            .colorInvert()
            .padding(.all, 20)
            
            Button(action: { isShowing = false },
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
        .frame(maxWidth: UIScreen.main.bounds.width * 0.85, maxHeight: UIScreen.main.bounds.height * 0.5)
        .background(Color("main"))
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .ignoresSafeArea(edges: .top)
        .padding()
    }
    
}
