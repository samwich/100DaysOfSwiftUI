//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Sam Johnson on 2022-12-13.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Form {
//            Textfi
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
