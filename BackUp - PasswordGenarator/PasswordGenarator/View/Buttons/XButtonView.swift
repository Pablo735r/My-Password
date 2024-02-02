//
//  XButtonView.swift
//  PasswordGenarator
//
//  Created by Pablo Amador on 22/1/24.
//

import SwiftUI

struct XButtonView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var symbolName: String
    var colorName: Color
    
    var body: some View {
        HStack {
            
            Spacer()
            Button {
                
                dismiss()
                
            }label: {
                Image(systemName: symbolName)
                    .frame(width: 44, height: 44)
                    .foregroundColor(colorName)
            }
            
        }
      
    }
}

#Preview {
    XButtonView(symbolName: "xmark.circle.fill", colorName: Color.black)
}
