//
//  ContentView.swift
//  iExpense
//
//  Created by Sam Johnson on 2022-11-25.
//

import SwiftUI

struct ItemListView: View {
    @ObservedObject var expenses: Expenses
    @State var type: String
    @State private var items: [ExpenseItem]
    
    init(expenses: Expenses, type: String) {
        self.expenses = expenses
        self.type = type
        self.items = expenses.items.filter { $0.type == type }
    }
    
    var body: some View {
        ForEach(items) { item in
            HStack {
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    Text(item.type)
                }
                
                Spacer()
                
                Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    .foregroundColor(colorForAmount(item.amount))
            }
        }
        .onDelete(perform: removeItems)
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
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
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                Section("Personal") {
                    ItemListView(expenses: expenses, type: "Personal")
                }
                Section("Business") {
                    ItemListView(expenses: expenses, type: "Business")
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
