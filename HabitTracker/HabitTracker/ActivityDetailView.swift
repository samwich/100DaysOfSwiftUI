//
//  ActivityDetailView.swift
//  HabitTracker
//
//  Created by Sam Johnson on 2022-12-10.
//

import SwiftUI

struct ActivityDetailView: View {
    @State var activity: Activity
    
    var body: some View {
        VStack {
            Text(activity.name)
            Text(activity.description)
            Text(activity.completionCount.formatted())
            Button("I did it!") {
                activity.completionCount += 1
            }
        }
    }
}

struct ActivityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetailView(activity: Activity(name: "foo", description: "bar"))
    }
}
