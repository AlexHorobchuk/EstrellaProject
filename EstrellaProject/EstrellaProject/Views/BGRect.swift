//
//  BGRect.swift
//  EstrellaProject
//
//  Created by Olha Dzhyhirei on 4/24/23.
//

import SwiftUI

struct BGRect: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .fill(LinearGradient(colors: [Color("tableTop"), Color("tableBottom")],
                                 startPoint: .top,
                                 endPoint: .bottom))
    }
}

struct BGRect_Previews: PreviewProvider {
    static var previews: some View {
        BGRect()
    }
}
