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
    var latitude: Double?
    var longitude: Double?
    
    var location: CLLocationCoordinate2D? {
        get {
            guard let latitude = latitude, let longitude = longitude else {
                return nil
            }
            return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
        set {
            if let newValue {
                latitude = newValue.latitude
                longitude = newValue.longitude
            }
            else {
                latitude = nil
                longitude = nil
            }
        }
    }
    
    var idString: String { id.uuidString }
    
    init(id: UUID, name: String, location: CLLocationCoordinate2D?) {
        self.id = id
        self.name = name
        self.location = location
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
