//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Sam Johnson on 2022-12-12.
//

import SwiftUI

struct ContentView: View {
    @StateObject var orderWrapper = OrderWrapper()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $orderWrapper.type) {
                        ForEach(OrderWrapper.types.indices, id: \.self) {
                            Text(OrderWrapper.types[$0])
                        }
                    }

                    Stepper("Number of cakes: \(orderWrapper.quantity)", value: $orderWrapper.quantity, in: 3...20)
                    
                    Section {
                        Toggle("Any special requests?", isOn: $orderWrapper.specialRequestEnabled.animation())
                        
                        if orderWrapper.specialRequestEnabled {
                            Toggle("Add extra frosting", isOn: $orderWrapper.extraFrosting)
                            Toggle("Add sprinkles", isOn: $orderWrapper.addSprinkles)
                        }
                    }
                    
                    Section {
                        NavigationLink {
                            AddressView(orderWrapper: orderWrapper)
                        } label: {
                            Text("Delivery details")
                        }
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
