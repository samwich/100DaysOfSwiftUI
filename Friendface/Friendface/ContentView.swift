//
//  ContentView.swift
//  Friendface
//
//  Created by Sam Johnson on 2022-12-20.
//

import SwiftUI

struct ContentView: View {
    @State var users: [User] = []
    
    let apiString = "https://www.hackingwithswift.com/samples/friendface.json"
    
    var body: some View {
        NavigationView {
            VStack {
                List(users) { user in
                    
                    NavigationLink {
                         UserDetailView(user: user)
//                        Text(user.name)
                    } label: {
                        // UserListItemView(user: user)
                        Text("\(user.name)\(user.isActive ? " 🎏" : "")")
                    }
                }
                .task {
                    await loadData()
                }
            }
            .navigationTitle("Friendface")
        }
    }
    
    func loadData() async {
        guard users.isEmpty else {
            return
        }
        
        print("Loading data at: \(Date.now)")
        
        guard let url = URL(string: apiString) else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            users = try decoder.decode([User].self, from: data)
        } catch {
            print("Problem fetching or decoding data.")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(users: [])
    }
}
