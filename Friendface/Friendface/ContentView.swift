//
//  ContentView.swift
//  Friendface
//
//  Created by Sam Johnson on 2022-12-20.
//

import SwiftUI

struct ContentView: View {
    @State var users: [User] = []
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var cachedUsers: FetchedResults<CachedUser>
    
    let apiString = "https://www.hackingwithswift.com/samples/friendface.json"
    
    var body: some View {
        NavigationView {
            VStack {
                List(cachedUsers) { user in
                    
                    NavigationLink {
                         UserDetailView(user: user)
//                        Text(user.name)
                    } label: {
                        // UserListItemView(user: user)
                        Text("\(user.wrappedName)\(user.isActive ? " 🎏" : "")")
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
            await MainActor.run {
                updateCache(with: users)
            }
        } catch {
            print("Problem fetching or decoding data.")
        }
    }
    
    func updateCache(with downloadedUsers: [User]) {
        for user in downloadedUsers {
            let cachedUser = CachedUser(context: moc)
            
            cachedUser.id = user.id
            cachedUser.isActive = user.isActive
            cachedUser.name = user.name
            cachedUser.age = Int16(user.age)
            cachedUser.company = user.company
            cachedUser.email = user.email
            cachedUser.address = user.address
            cachedUser.about = user.about
            cachedUser.registered = user.registered
            cachedUser.tags = user.tags.joined(separator: ",")
            
            for friend in user.friends {
                let cachedFriend = CachedFriend(context: moc)
                cachedFriend.id = friend.id
                cachedFriend.name = friend.name
                cachedUser.addToFriends(cachedFriend)
            }
        }
        
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(users: [])
    }
}
