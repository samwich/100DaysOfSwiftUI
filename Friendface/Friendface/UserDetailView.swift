//
//  UserDetailView.swift
//  Friendface
//
//  Created by Sam Johnson on 2022-12-20.
//

import SwiftUI

struct UserDetailView: View {
    @State var user: CachedUser
    var body: some View {
        VStack{
            Section {
                Text(user.isActive ? "online" : "offline")

                Text(user.age.formatted())

                Text(user.wrappedCompany)

                Text(user.wrappedEmail)

                Text(user.wrappedAddress)

                ScrollView {
                    Text(user.wrappedAbout)
                }

                Text(user.wrappedRegistered.formatted())
            }
            .padding()
            
            Section {
                Text(user.wrappedTags)
            }
            .padding()

            List(user.friendsArray) { friend in
                Text(friend.wrappedName)
            }
        }
        .navigationTitle(user.wrappedName)
    }
}

//struct UserDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            UserDetailView(user: User.example)
//        }
//    }
//}
