//
//  RollStorageManager.swift
//  Dice
//
//  Created by Sam Johnson on 2023-11-14.
//

import Foundation

struct RollStorageManager {
    static let savePath = FileManager.documentsDirectory.appendingPathComponent("allRolls")
    
    static func load() -> [Roll] {
        do {
            let data = try Data(contentsOf: savePath)
            return try JSONDecoder().decode([Roll].self, from: data)
        } catch {
            print("Unable to load rolls.")
        }
        
        return []
    }
    
    static func save(rolls: [Roll]) {
        do {
            let encoded = try JSONEncoder().encode(rolls)
            try encoded.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save rolls to savePath.")
        }
    }
}
