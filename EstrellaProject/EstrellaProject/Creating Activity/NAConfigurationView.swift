//
//  NAConfigurationView.swift
//  EstrellaProject
//
//  Created by Olha Dzhyhirei on 4/20/23.
//

import SwiftUI

struct NAConfigurationView: View {
    
    @State var showNext = false
    @Binding var popView: Bool
    @ObservedObject var viewModel: ActivityVM
    
    var body: some View {
        
        BaseSecondView( buttonText: "NEXT",
                        popView: { popView = false },
                        buttonAction: { showNext = true } ) {
            VStack {
                
                HStack {
                    Text("How urgents is it ?")
                        .foregroundColor(.white)
                        .font(.system(size: 19))
                        .padding()
                    
                    Spacer()
                }
                
                CustomSlider(value: $viewModel.activity.urgency,
                             maxBound: viewModel.description.maxUrgency,
                             minBound: viewModel.description.minUrgency)
                
                Spacer(minLength: 15)
                
                HStack {
                    Text("How important is it ?")
                        .foregroundColor(.white)
                        .font(.system(size: 19))
                        .padding()
                    
                    Spacer()
                }
                
                CustomSlider(value: $viewModel.activity.importance,
                             maxBound: viewModel.description.maxImportance,
                             minBound: viewModel.description.minImportance)
            }
            .padding(35)
        }
        NavigationLink(destination: NASaveView(popView: $showNext,
                                               viewModel: viewModel),
                       isActive: $showNext) { EmptyView() }
    }
}

struct NAConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        NAConfigurationView( popView: .constant(true), viewModel: ActivityVM())
    }
}
