//
//  ResultTextFieldView.swift
//  PasswordGenarator
//
//  Created by Pablo Amador on 23/1/24.
//

import SwiftUI

struct ResultTextFieldView: View {
    
    
    @Binding var myResult: String
    @Environment(\.colorScheme) var colorScheme
    
    var noValues = "No values selected"
    
    var body: some View {
        
        VStack {
           
            TextField(noValues, text: $myResult)
                .frame(width: 320, height: 25)
                .multilineTextAlignment(.center)
                .foregroundColor(colorScheme == .light ? .black : .white)
                .bold()
                .padding(15)
                .font(.system(size: 20))
                .autocorrectionDisabled()
                .background(RoundedRectangle(cornerRadius: 9).stroke(Color(.systemOrange), lineWidth: 7))
                .background(
                        Color(colorScheme == .light ? .white : .black)
                            .opacity(0.2)
                            .shadow(
                                color: Color.black.opacity(0.3),
                                radius: 10, x: 0.0,y: 10)
                            )
        }
    }
}

#Preview {
    ResultTextFieldView(myResult: .constant(""))
}
