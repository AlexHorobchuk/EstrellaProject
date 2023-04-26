//
//  CreateActevityView.swift
//  EstrellaProject
//
//  Created by Olha Dzhyhirei on 4/19/23.
//

import SwiftUI

struct NADataAndNameView: View {
    
    @Binding var popView: Bool
    @StateObject var viewModel = ActivityVM()
    @State var showNext = false
    @State var showDatePicker = false
    @State var nameIsEmpty = false
    
    func goToNextScreen() {
        if viewModel.activity.name.isEmpty {
            nameIsEmpty = true
        } else {
            showNext = true
        }
    }
    
    var body: some View {
        BaseSecondView( buttonText: "NEXT",
                        popView: { popView = false },
                        buttonAction: goToNextScreen ) {
            VStack {
                
                HStack {
                    Text("Name of activity")
                        .foregroundColor(.white)
                        .font(.system(size: 19))
                        .padding()
                    
                    Spacer()
                }
                
                TextField("Enter name", text: $viewModel.activity.name)
                    .foregroundColor(.black)
                    .colorInvert()
                    .font(.system(size: 19))
                    .padding()
                    .clipShape(Capsule())
                    .overlay(Capsule().stroke(Color("buttonYellow"), lineWidth: 3))
                    .padding(.bottom, 40)
                
                
                
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(.white)
                        .font(.system(size: 26))
                        .padding(.leading)
                    
                    Text("Deadline")
                        .foregroundColor(.white)
                        .font(.system(size: 19))
                        .padding()
                    
                    Spacer()
                }
                
                Button(action: { showDatePicker = true },
                       label: { Text(viewModel.activity.date, style: .date)
                        .foregroundColor(.black)
                        .colorInvert()
                        .font(.system(size: 20))
                        .padding()
                        .frame(width: 300, height: 55)
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(Color("buttonYellow"), lineWidth: 3))
                })
                .padding(.bottom, 40)
                .popover(isPresented: $showDatePicker) {
                    DatePopover(dateIn: $viewModel.activity.date, isShowing: $showDatePicker)
                        .clearModalBackground()
                }
                .fullScreenCover(isPresented: $nameIsEmpty) {
                    CustomAlert(isShowing: $nameIsEmpty,
                                title: AlertItem.getText(.nameIsEmpty)()).clearModalBackground()
                }
                
            }
            .padding(35)
        }
        
        NavigationLink(destination: NAConfigurationView(popView: $showNext,
                                                        viewModel: viewModel),
                       isActive: $showNext, label: { EmptyView() })
    }
    
}

struct CreateActevityView_Previews: PreviewProvider {
    static var previews: some View {
        NADataAndNameView(popView: .constant(true), viewModel: ActivityVM())
    }
}
