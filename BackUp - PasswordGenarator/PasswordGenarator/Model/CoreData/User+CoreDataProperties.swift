//
//  User+CoreDataProperties.swift
//  PasswordGenarator
//
//  Created by Pablo Rojas on 12/11/22.
//
//

import Foundation
import CoreData


extension User {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }
    
    @NSManaged public var siteName: String?
    @NSManaged public var userName: String?
    @NSManaged public var password: String?
    @NSManaged public var date: Date?
   
    
    public var unwrappedSiteName: String {
        siteName ?? "profile not saved"
        
    }
    public var unwrappedUserName: String {
        userName ?? "profile not saved"
        
    }
    public var unwrappedPassword: String {
        password ?? "profile not saved"
        
    }
    
}

extension User : Identifiable {

}




