//
//  Person.swift
//  Nomenclator
//
//  Created by Sam Johnson on 2023-02-21.
//

import Foundation

struct Person: Codable, Equatable, Identifiable {
    let id: UUID
    var name: String
    
    var idString: String { id.uuidString }
    
    func imageURL() -> URL {
        return FileManager.documentsDirectory.appendingPathComponent(idString)
    }
    
    static var peopleURL: URL {
        return FileManager.documentsDirectory.appendingPathComponent("people.json")
    }
}
