//
//  NewActivityScreen.swift
//  EstrellaProject
//
//  Created by Olha Dzhyhirei on 4/18/23.
//

import SwiftUI

struct NewActivityView: View {
    
    @EnvironmentObject var navigationHelper: NavigationHelper
    
    var body: some View {
        
        NavigationView {
            
            BaseFirstView() {
                
                VStack {
                    Image("img 1")
                        .resizable()
                        .scaledToFit()
                        .padding()
                    
                    Button(action: { navigationHelper.showNextView = true  } ,
                                   label: {
                        HStack {
                            Image("list")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                            
                            Text("CREATE ACTIVITY")
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .font(.system(size: 22))
                            
                        }
                        .frame(width: 265, height: 50)
                        .background(Color("buttonYellow"))
                        .clipShape(Capsule())
                        .shadow(color: .white, radius: 5)
                        .padding(.top, 5)
                        
                    })
                    
                    NavigationLink(destination: NADataAndNameView(popView: $navigationHelper.showNextView),
                                   isActive: $navigationHelper.showNextView) {
                        EmptyView()
                    }
                }
            }
        }
        .accentColor(.white)
        .navigationViewStyle(.stack)
    }
}

struct NewActivityScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewActivityView()
    }
}
