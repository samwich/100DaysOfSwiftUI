//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Sam Johnson on 2022-11-25.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
