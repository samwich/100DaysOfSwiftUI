//
//  ContentView.swift
//  iExpense
//
//  Created by Sam Johnson on 2022-11-25.
//

import SwiftUI

struct ItemListView: View {
    let items: [ExpenseItem]
    let deleteItems: (IndexSet) -> Void
        
    var body: some View {
        ForEach(items) { item in
            HStack {
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    Text(item.type)
                }
                
                Spacer()
                
                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .foregroundColor(colorForAmount(item.amount))
            }
            .accessibilityElement()
            .accessibilityLabel("\(item.name), \(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
            .accessibilityHint(item.type)
        }
        .onDelete(perform: deleteItems)
    }
    
    func colorForAmount(_ amount: Double) -> Color {
        if amount < 10 {
            return .green
        } else if amount > 100 {
            return .red
        } else {
            return .primary
        }
    }
}

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Personal") {
                    ItemListView(items: expenses.personalItems, deleteItems: removePersonalItems)
                }
                Section("Business") {
                    ItemListView(items: expenses.businessItems, deleteItems: removeBusinessItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet, in inputArray: [ExpenseItem]) {
        var offsetsToDelete = IndexSet()
        
        for offset in offsets {
            let item = inputArray[offset]
            
            if let targetOffset = expenses.items.firstIndex(of: item) {
                offsetsToDelete.insert(targetOffset)
            }
        }
        
        expenses.items.remove(atOffsets: offsetsToDelete)
    }

    func removePersonalItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.personalItems)
    }

    func removeBusinessItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.businessItems)
    }
}

#Preview {
    ContentView()
}
