//
//  SavedPassword.swift
//  PasswordGenarator
//
//  Created by Pablo Amador on 30/1/24.
//

import Foundation

struct SavedPasswordModel {
    
    //Coredata properties
    var siteName: String
    var userName: String
    var password: String
    var isPresentedUser: Bool = false
    var isPresentedUserCreate: Bool = false
    var userToSearch = ""
}
