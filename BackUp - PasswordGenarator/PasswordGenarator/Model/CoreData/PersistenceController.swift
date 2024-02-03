//
//  PersistenceController.swift
//  PasswordGenarator
//
//  Created by Pablo Rojas on 12/11/22.
//

import CoreData
import Foundation

class DataController: ObservableObject{
    
    let containner = NSPersistentContainer(name: "Passwords")
    
    init(){
        containner.loadPersistentStores { description, error in
            if let error = error{
                print("Core Data Failed to load:\(error.localizedDescription)")
            }
        }
    }
    
     func saveContext(context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch {
            let error = error as NSError
            fatalError("An error occured: \(error)")
        }
    }

}

    

