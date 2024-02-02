//
//  SwiftUIView.swift
//  PasswordGenarator
//
//  Created by Pablo Amador on 10/4/23.
//

import SwiftUI

struct SecurityTipsView: View {
    
    var body: some View {
        
        ZStack {
            
            NavigationStack {
                
                List {
                    
                    ForEach(tips) { tip in // comes form Extension Tips
                        HStack {
                            NavigationLink(destination:  DetailSecurityTipView(tip: tip)) {
                                
                                Text("\(tip.id).")
             
                                    .foregroundColor(Color(.label))
                                Text(tip.title)

                                    .foregroundColor(Color(.label))
                            }
                                
                        }
                   
                    }
                    
                }
                .padding()
                .navigationBarTitle("Security Tips", displayMode: .inline)//remove the white space on the top
                .listStyle(.inset)
            }
           
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SecurityTipsView()
    }
}



