//
//  ToggleCard.swift
//  PasswordGenarator
//
//  Created by Pablo Amador on 19/1/24.
//

import SwiftUI

import SwiftUI

struct ToggleCard: View {
    
    let title: String
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var isOn: Bool
    
    var body: some View {
        
        VStack {
            Toggle(title, isOn: $isOn)
                
                .padding(10)
                .foregroundColor(colorScheme == .light ? .black : .white)
                .bold()
                .toggleStyle(SwitchToggleStyle(tint: .orange))
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .font(isOn ? .system(size: 19) : .system(size: 17))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.orange, lineWidth: isOn ? 4 : 0)
                )
        }
        .padding()
    }
}

#Preview {
    ToggleCard(title: "Test", isOn: .constant(true))
}
