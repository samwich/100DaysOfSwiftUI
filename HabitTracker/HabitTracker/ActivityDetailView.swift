//
//  ActivityDetailView.swift
//  HabitTracker
//
//  Created by Sam Johnson on 2022-12-10.
//

import SwiftUI

struct ActivityDetailView: View {
    @State var activity: Activity
    @State var activities: Activities
    
    var body: some View {
        VStack {
            Text(activity.name)
            Text(activity.description)
            Text("You've completed \(activity.name) \(activity.completionCount.formatted()) times.")
            Button("I did it!") {
                incrementCompletionCount()
            }
        }
    }
    
    func incrementCompletionCount() {
        var replacementActivity = activity
        replacementActivity.completionCount += 1
        if let activityIndex = activities.items.firstIndex(of: activity) {
            activities.items[activityIndex] = replacementActivity
            activity = replacementActivity
        }
    }
}

struct ActivityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetailView(
            activity: Activity(name: "foo", description: "bar"),
            activities: Activities()
        )
    }
}
