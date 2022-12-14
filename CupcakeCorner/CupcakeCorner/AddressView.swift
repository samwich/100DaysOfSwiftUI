//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Sam Johnson on 2022-12-13.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var orderWrapper: OrderWrapper
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $orderWrapper.name)
                TextField("Street Address", text: $orderWrapper.streetAddress)
                TextField("City", text: $orderWrapper.city)
                TextField("ZIP", text: $orderWrapper.zip)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(orderWrapper: orderWrapper)
                } label: {
                    Text("Check out")
                }
            }
            .disabled(orderWrapper.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddressView(orderWrapper: OrderWrapper())
        }
    }
}
