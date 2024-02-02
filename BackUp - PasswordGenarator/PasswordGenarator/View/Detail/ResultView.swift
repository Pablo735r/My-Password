//
//  HomeView.swift
//  PasswordGenarator
//
//  Created by Pablo Rojas on 29/10/22.
//

import SwiftUI

struct ResultView: View {
    
    @Binding var progress: Int
    @Binding var myResult: String
    
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        
        NavigationStack {
            
            VStack (spacing: 100){
                
                Spacer()
                
                ResultTitledView(tittle: "Your new password!", colorName: Color(.label))
                
                ResultTextFieldView(myResult: $myResult)
                
                ProgressBar(progress: CGFloat(stringLength(myResult)))
                
                Spacer()
                
            }
            .navigationBarItems(trailing:
                                    Button{
                withAnimation {
                    dismiss()
                }
                
                
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .frame(width: 44, height: 44)
                    .foregroundStyle(Color(.label))
                
            }
            )}
        
    }
    
    
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        
        ResultView(progress:.constant(Int(1.0)), myResult: .constant(""))
    }
}




