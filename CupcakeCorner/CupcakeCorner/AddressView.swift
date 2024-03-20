//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Sam Johnson on 2022-12-13.
//

import SwiftUI

struct AddressView: View {
    @Bindable var orderWrapper: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $orderWrapper.name)
                TextField("Street Address", text: $orderWrapper.streetAddress)
                TextField("City", text: $orderWrapper.city)
                TextField("ZIP", text: $orderWrapper.zip)
            }
            
            Section {
                NavigationLink("Check out") {
                    CheckoutView(orderWrapper: orderWrapper)
                }
            }
            .disabled(orderWrapper.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AddressView(orderWrapper: Order())
}
