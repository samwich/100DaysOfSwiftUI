//
//  Activities.swift
//  HabitTracker
//
//  Created by Sam Johnson on 2022-12-10.
//

import Foundation

class Activities: ObservableObject {
    let itemKey = "Activities"
    
    @Published var items = [Activity]() {
        didSet {
            if let encodedItems = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encodedItems, forKey: itemKey)
            }
        }
    }
    
    init() {
        if let loadedItems = UserDefaults.standard.data(forKey: itemKey) {
            if let decodedItems = try? JSONDecoder().decode([Activity].self, from: loadedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}
