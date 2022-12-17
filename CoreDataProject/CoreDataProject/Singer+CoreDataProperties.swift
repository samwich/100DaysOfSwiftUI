//
//  Singer+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Sam Johnson on 2022-12-16.
//
//

import Foundation
import CoreData


extension Singer {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }
    
    @NSManaged public var lastName: String?
    @NSManaged public var firstName: String?
    
    var wrappedFirstName: String {
        firstName ?? "Unknown"
    }
    
    var wrappedLastName: String {
        lastName ?? "Unknown"
    }
}

extension Singer : Identifiable {

}
