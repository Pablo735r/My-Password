//
//  ResultTitledView.swift
//  PasswordGenarator
//
//  Created by Pablo Amador on 23/1/24.
//

import SwiftUI

struct ResultTitledView: View {
    
    var tittle: String
    var colorName: Color
    
    var body: some View {
        VStack {
            
            Text(tittle)
                .foregroundColor(colorName)
                .bold()
                .font(.system(size: 20))
                .foregroundColor(.white)
        }
        
    }
}

#Preview {
    ResultTitledView(tittle: "Your new password!", colorName: Color.black)
}
