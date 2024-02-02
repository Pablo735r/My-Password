//
//  CreatePasswordViewModel.swift
//  PasswordGenarator
//
//  Created by Pablo Amador on 30/1/24.
//

import Foundation

class CreatePasswordViewModel: ObservableObject {
    
    @Published var createPassword: CreatePasswordModel
    
    init(createPassword: CreatePasswordModel) {
        self.createPassword = createPassword
    }
}

var sampleCreatePasswordViewModel = CreatePasswordViewModel(createPassword: CreatePasswordModel(stepperValue: 6, myResult: "", isPresentedResult: false, isPresentedSavedPassword: false, isOnUpperCase: false, isOnLowerCase: false, isOnNumbers: false, isOnSymbols: false, upperCaseLetters: "", lowerCaseLetters: "", numbers: "", symbols: ""))
