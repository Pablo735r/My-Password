//
//  History+CoreDataProperties.swift
//  PasswordGenarator
//
//  Created by Pablo Amador on 19/1/24.
//
//

import Foundation
import CoreData


extension History {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<History> {
        return NSFetchRequest<History>(entityName: "History")
    }

    @NSManaged public var history: String?
    @NSManaged public var date: Date?
    
    public var unwrappedHistory: String {
        history ?? "history not saved"
        
    }

}

extension History : Identifiable {

}
