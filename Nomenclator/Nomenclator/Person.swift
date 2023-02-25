//
//  Person.swift
//  Nomenclator
//
//  Created by Sam Johnson on 2023-02-21.
//

import CoreLocation
import Foundation

struct Person: Codable, Comparable, Equatable, Identifiable {
    let id: UUID
    var name: String
    var latitude: Double
    var longitude: Double
    
    var location: CLLocationCoordinate2D {
        get { CLLocationCoordinate2D(latitude: latitude, longitude: longitude) }
        set {
            latitude = newValue.latitude
            longitude = newValue.longitude
        }
    }
    
    var idString: String { id.uuidString }
    
    init(id: UUID, name: String, location: CLLocationCoordinate2D) {
        self.id = id
        self.name = name
        self.latitude = location.latitude
        self.longitude = location.longitude
    }
    
    func imageURL() -> URL {
        return FileManager.documentsDirectory.appendingPathComponent(idString)
    }
    
    static var peopleURL: URL {
        return FileManager.documentsDirectory.appendingPathComponent("people.json")
    }
    
    static func < (lhs: Person, rhs: Person) -> Bool {
        lhs.name < rhs.name
    }
}
