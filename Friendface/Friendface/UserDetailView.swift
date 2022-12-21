//
//  UserDetailView.swift
//  Friendface
//
//  Created by Sam Johnson on 2022-12-20.
//

import SwiftUI

struct UserDetailView: View {
    @State var user: User
    var body: some View {
        VStack{
            Section {
                Text(user.isActive ? "online" : "offline")

                Text(user.age.formatted())

                Text(user.company)

                Text(user.email)

                Text(user.address)

                ScrollView {
                    Text(user.about)
                }

                Text(user.registered.formatted())
            }
            
            Text(user.tags.joined(separator: ", "))
                .padding()

            List(user.friends) { friend in
                Text(friend.name)
            }
        }
        .navigationTitle(user.name)
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserDetailView(user: User.example)
        }
    }
}
