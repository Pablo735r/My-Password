//
//  SavedPasswordsViewModel.swift
//  PasswordGenarator
//
//  Created by Pablo Amador on 30/1/24.
//

import Foundation

class SavedPasswordsViewModel: ObservableObject {
        
    @Published var savedPassword: SavedPasswordModel
    
    init(savedPassword: SavedPasswordModel) {
        self.savedPassword = savedPassword
    }
}

let sampleSavedPasswordsViewModel = SavedPasswordsViewModel(savedPassword: SavedPasswordModel(siteName: "", userName: "", password: "", isPresentedUser: false, isPresentedUserCreate: false, userToSearch: ""))
