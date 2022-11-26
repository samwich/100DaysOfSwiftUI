//
//  Expenses.swift
//  iExpense
//
//  Created by Sam Johnson on 2022-11-25.
//

import Foundation

class Expenses: ObservableObject {
    let itemKey = "Items"
    
    @Published var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: itemKey)
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: itemKey) {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}
