//
//  ContentView.swift
//  BetterRest
//
//  Created by Sam Johnson on 2022-11-13.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    var body: some View {
        
        VStack {
            Stepper("\(sleepAmount.formatted())", value: $sleepAmount, in: 4...12, step: 0.25)
            DatePicker("Please enter a date", selection: $wakeUp)
                .labelsHidden()
            DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .date)
            DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
            DatePicker("Please enter a future date", selection: $wakeUp, in: Date.now...)
        }
    }
    
    func exampleDateRange() {
        let tomorrow = Date.now.addingTimeInterval(86_400)
        let range = Date.now...tomorrow
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
