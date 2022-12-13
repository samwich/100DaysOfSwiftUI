//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Sam Johnson on 2022-12-12.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var email = ""

    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("Creating account…")
                }
            }
            .disabled(username.isEmpty || email.isEmpty)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
