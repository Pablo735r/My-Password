//
//  CreateButtonView.swift
//  PasswordGenarator
//
//  Created by Pablo Amador on 23/1/24.
//

import SwiftUI

struct CreateButtonView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        Text("Create")
            .foregroundColor(colorScheme == .light ? .white : .white)
            .frame(width: 155, height: 35)
            .font(.system(size: 15))
            .background(Color(colorScheme == .light ? .systemOrange : .black))
            .cornerRadius(10)
            .bold()
    }
}

#Preview {
    CreateButtonView()
}
