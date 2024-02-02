//
//  MenuOptionsView.swift
//  PasswordGenarator
//
//  Created by Pablo Amador on 17/4/23.
//

import SwiftUI

struct MenuOptionsView: View {
    
    @State var selectedTab: Int = 0

    
    var body: some View {
    
            TabView(selection: $selectedTab) {
                
                        CreatePasswordView(cPModel: sampleCreatePasswordViewModel)
                            .tabItem {

                                Label("Create password", systemImage: "checkerboard.shield")
                            }
                            .tag(0)
                            .padding(.bottom,0.2)
                        
                        
                        SavedPasswords(sPModel: sampleSavedPasswordsViewModel, detailModel: sampleDetailView)
                            .tabItem {

                                Label("Saved", systemImage: "square.and.arrow.down")
                            }
                            .tag(1)
                            .padding(.bottom,0.5)
                        
                        SecurityTipsView()
                            .tabItem {

                                Label("Security tips", systemImage: "lock")
                            }
                            .tag(2)
                            .padding(.bottom,0.5)
                
                        HistoryView()
                            .tabItem {

                                Label("History", systemImage: "clock")
                            }
                            .tag(3)
                            .padding(.bottom,0.5)
                }
                
            }
    
        }


struct MenuOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuOptionsView()
    }
}
