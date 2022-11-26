//
//  ContentView.swift
//  iExpense
//
//  Created by Sam Johnson on 2022-11-25.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct ContentView: View {
    @StateObject var user = User()
    
    var body: some View {
        VStack {
            Text("Hello, \(user.firstName) \(user.lastName)!")
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
