//
//  CreatePassword.swift
//  PasswordGenarator
//
//  Created by Pablo Amador on 30/1/24.
//

import Foundation
import SwiftUI

struct CreatePasswordModel {
    
     var stepperValue: Int
     var myResult: String //the value that goes to the resultview
     var isPresentedResult: Bool = false
     var isPresentedSavedPassword  = false
    
    //Boolean variables for Toggles
     var isOnUpperCase = false
     var isOnLowerCase = false
     var isOnNumbers = false
     var isOnSymbols = false
    
    //variables for Toggles
     var upperCaseLetters: String
     var lowerCaseLetters: String
     var numbers: String
     var symbols: String
}


