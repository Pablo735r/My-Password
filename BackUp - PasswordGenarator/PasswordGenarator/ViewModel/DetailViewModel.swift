//
//  DetailViewModel.swift
//  PasswordGenarator
//
//  Created by Pablo Amador on 1/2/24.
//

import Foundation

class DetailViewModel: ObservableObject {
    
    @Published var detailView: DetailModel
    
    init(detailView: DetailModel) {
        self.detailView = detailView
    }
}

var sampleDetailView = DetailViewModel(detailView: DetailModel(siteName: "", userName: "", password: ""))
