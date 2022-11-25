//
//  ContentView.swift
//  iExpense
//
//  Created by Sam Johnson on 2022-11-25.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    let name: String
    
    var body: some View {
        Button("Dismiss, \(name)!") {
            dismiss()
        }
    }
}

struct ContentView: View {
    @State private var showingSheet = false
    
    var body: some View {
        VStack {
            Button("Show sheet") {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                SecondView(name: "@twostraws")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
