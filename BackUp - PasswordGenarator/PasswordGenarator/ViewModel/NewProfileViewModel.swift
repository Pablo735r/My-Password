//
//  NewProfileViewModel.swift
//  PasswordGenarator
//
//  Created by Pablo Amador on 30/1/24.
//

import Foundation

class NewProfileViewModel: ObservableObject {
    
    @Published var newProfile: NewProfileModel
    
    init(newProfile: NewProfileModel) {
        self.newProfile = newProfile
    }
}

var sampleNewProfileModel = NewProfileViewModel(newProfile: NewProfileModel(siteName: "", userName: "", password: "", isValidate: false))
