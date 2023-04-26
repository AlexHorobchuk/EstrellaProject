//
//  CustomSlider.swift
//  EstrellaProject
//
//  Created by Olha Dzhyhirei on 4/23/23.
//

import SwiftUI

struct CustomSlider: View {
    
    @Binding var value: Int
    var maxBound: Int
    var minBound: Int
    
    var body: some View {
        HStack {
            ForEach(minBound...maxBound, id: \.self) { number in
                Text("\(number)")
                    .foregroundColor(.white)
                
            }
            .frame(maxWidth: .infinity)
        }
        
        ZStack {
            LinearGradient(colors: [Color("sliderMin"), Color("sliderMax")], startPoint: .leading, endPoint: .trailing)
                .mask(Slider(value: Binding(
                    get: { Double(value) },
                    set: { value = Int($0) }),
                             in: Double(minBound)...Double(maxBound),
                             step: 1))
            
            Slider(value: Binding(
                get: { Double(value) },
                set: { value = Int($0) }),
                in: 1...5,
                step: 1)
                .accentColor(Color.clear)
                .shadow(color: .white, radius: 6)
                .onAppear {
                    let thumbImage = UIImage(named: "slider")?.scale(by: 0.5)
                    UISlider.appearance().setThumbImage(thumbImage, for: .normal)
                    
                }
                
        }
        .padding(.horizontal)
    }
}
