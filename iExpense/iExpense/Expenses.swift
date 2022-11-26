//
//  Expenses.swift
//  iExpense
//
//  Created by Sam Johnson on 2022-11-25.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
