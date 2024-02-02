//
//  TipHomeView.swift
//  PasswordGenarator
//
//  Created by Pablo Amador on 1/2/24.
//

import SwiftUI

struct TipHomeView: View {
    
    @State var title: String
    @State var tip: String
    
    var body: some View {
        
        HStack {
            Text(title)
                .bold()
                .font(.system(.title3))
                .foregroundStyle(Color(.label))
            Image(systemName: "lightbulb.max")
                .foregroundColor(.yellow)
        }
        
        VStack {
           
            Text(tip)
                .italic()
                .bold()
                .foregroundStyle(Color(.label))
                .padding(.top, 5)
            Spacer()
        }
    }
}

#Preview {
    TipHomeView(title: "Tip", tip: "Try to include special characters and numbers to get a stronger password")
}
