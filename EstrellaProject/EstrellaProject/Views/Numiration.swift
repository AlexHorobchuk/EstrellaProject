//
//  Numiration.swift
//  EstrellaProject
//
//  Created by Olha Dzhyhirei on 4/24/23.
//

import SwiftUI

struct Numiration: View {
    
    let description: Description
    let type: DescriptionType
    
    var body: some View {
        if type == .urgency {
            VStack {
                ForEach(description.minUrgency...description.maxUrgency,
                        id: \.self) { urgency in
                    Text("\(urgency)")
                        .foregroundColor(.white)
                        .padding(.vertical, 17)
                    
                }
                Spacer()
            }
        } else {
            HStack {
                ForEach(description.minImportance...description.maxImportance,
                        id: \.self) { importance in
                    Text("\(importance)")
                        .foregroundColor(.white)
                        .padding(.horizontal, 23)

                }
            }
        }
    }
}

