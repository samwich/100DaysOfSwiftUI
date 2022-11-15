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
            DatePicker("Please enter a future date", selection: $wakeUp, in: exampleDateRange())
            DatePicker("Please enter a future date", selection: $wakeUp, in: Date.now...)
            Text(exampleChooseWakeUpTime().formatted())
            Text(Date.now, format: .dateTime.hour().minute())
            Text(Date.now, format: .dateTime.year().month().day())
            Text(Date.now.formatted(date: .long, time: .shortened))
        }
    }
    
    func exampleDateRange() -> ClosedRange<Date> {
        let tomorrow = Date.now.addingTimeInterval(86_400)
        let range = Date.now...tomorrow
        return range
    }
    
    func exampleChooseWakeUpTime() -> Date {
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        let date = Calendar.current.date(from: components) ?? Date.now
        return date
    }

    func exampleReadComponents() {
        let components = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
