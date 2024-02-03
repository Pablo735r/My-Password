//
//  SwiftUIView.swift
//  PasswordGenarator
//
//  Created by Pablo Amador on 1/12/22.
//

import SwiftUI

struct EyeView: View {
    
    @State var isSecureTextField: Bool = true
    @Binding var passText: String
    var placeholder: String
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
       
                HStack {
                    
                        if isSecureTextField{
                            SecureField(placeholder,text: $passText)
                        }else{
                            TextField(passText, text: $passText)
                        }
                        
                    }
                    .overlay(alignment: .trailing){
                        Text( isSecureTextField ? "show" : "hide")
                            .foregroundStyle(.gray)
                            .onTapGesture {
                                isSecureTextField.toggle()
                            }
                }
        
            }
        
        }
    


struct EyeView_Previews: PreviewProvider {
    static var previews: some View {
        EyeView(passText: .constant("smf8jd923"), placeholder: "password")
    }
}
