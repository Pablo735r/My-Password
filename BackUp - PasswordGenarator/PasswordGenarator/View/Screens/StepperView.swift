//
//  StepperView.swift
//  PasswordGenarator
//
//  Created by Pablo Amador on 25/1/24.
//

import SwiftUI


struct StepperView: View {
    
    @Binding var stepperValue: Int
    
    var body: some View {
        HStack {
            Stepper("Select lenght", value: $stepperValue, in: 6...24)
                .overlay(HStack { //para ponerlo en el centro
                    Text("\(stepperValue)")
                        .font(.system(size: 20))
                })
                .padding(10)
                .bold()
            
        }
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        .padding()
    }
}

#Preview {
    StepperView(stepperValue: .constant(6))
}
