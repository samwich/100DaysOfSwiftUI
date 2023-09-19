//
//  Prospect.swift
//  HotProspects
//
//  Created by Sam Johnson on 2023-04-06.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
}

@MainActor class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect]
    let saveKey = "SavedData"
    let savePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("Prospects")

    init() {
        
        do {
            let data = try Data(contentsOf: savePath)
            people = try JSONDecoder().decode([Prospect].self, from: data)
        } catch {
            print("JSON not loaded from FileManager. Trying UserDefaults.")
            if let data = UserDefaults.standard.data(forKey: saveKey) {
                if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
                    people = decoded
                    return
                }
            }
            print("JSON not loaded from UserDefaults. First launch.")
            people = []
        }
    }
    
    private func save() {
        do {
            let encoded = try JSONEncoder().encode(people)
            try encoded.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save prospects to savePath.")
        }
    }
    
    func add(_ person: Prospect) {
        people.append(person)
        save()
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
}
