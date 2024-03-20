//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Sam Johnson on 2022-12-12.
//

import SwiftUI

struct ContentView: View {
    @State private var orderWrapper = Order()
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Select your cake type", selection: $orderWrapper.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }

                    Stepper("Number of cakes: \(orderWrapper.quantity)", value: $orderWrapper.quantity, in: 3...20)
                    
                    Section {
                        Toggle("Any special requests?", isOn: $orderWrapper.specialRequestEnabled)
                        
                        if orderWrapper.specialRequestEnabled {
                            Toggle("Add extra frosting", isOn: $orderWrapper.extraFrosting)
                            Toggle("Add sprinkles", isOn: $orderWrapper.addSprinkles)
                        }
                    }
                    
                    Section {
                        NavigationLink("Delivery details") {
                            AddressView(orderWrapper: orderWrapper)
                        }
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

#Preview {
    ContentView()
}
