//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Sam Johnson on 2023-11-16.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct ContentView: View {
    @State private var selectedUser: User? = nil
    @State private var isShowingAlert = false

    var body: some View {
        Text("Hello, Sheet!")
            .onTapGesture {
                selectedUser = User()
            }
            .sheet(item: $selectedUser) { user in
                Text(user.id)
            }
        
        Text("Hello, Alert!")
            .onTapGesture {
                isShowingAlert = true
            }
            .alert("Welcome", isPresented: $isShowingAlert) {
//                Button("Alrighty") {}
            }
    }
}

#Preview {
    ContentView()
}
