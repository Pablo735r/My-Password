//
//  DataStruct.swift
//  PasswordGenarator
//
//  Created by Pablo Rojas on 6/10/22.
//

import Foundation
import SwiftUI

struct RandomStringModel {
    
    let upperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let lowerCase = "abcdefghijklmnopqrstuvwxyz"
    let numbers = "0123456789"
    let symbols = "!#$%&()*+-./<=>?@[\\]_{}"
    
    
    func randomWords(stepperValue: Int, upperCase: String, lowerCase: String, numbers: String, symbols: String) -> String{
        
        let words = upperCase + lowerCase + numbers + symbols
        var newPassword = ""
        
        for _ in 0 ..< stepperValue {
            
            if !words.isEmpty{
                newPassword.append(words.randomElement()!)
                
            }
            
        }
        
        return newPassword
        
    }
    
    
}


