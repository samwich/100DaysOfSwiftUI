//
//  CachedFriend+CoreDataProperties.swift
//  Friendface
//
//  Created by Sam Johnson on 2022-12-20.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var user: CachedUser?

    public var wrappedName: String {
        name ?? "Unknown"
    }
}

extension CachedFriend : Identifiable {

}
