//
//  PasswordGenaratorApp.swift
//  PasswordGenarator
//
//  Created by Pablo Rojas on 6/10/22.
//

import SwiftUI

@main
struct PasswordGenaratorApp: App {
    
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            MenuOptionsView()
                .environment(\.managedObjectContext,
                              dataController.containner.viewContext)
        }
    }
}

