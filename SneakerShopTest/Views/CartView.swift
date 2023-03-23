//
//  CartView.swift
//  SneakerShopTest
//
//  Created by Андрей Барсуков on 20.03.2023.
//

import SwiftUI

struct CartView: View {
    
    @StateObject var viewModel: CartViewModel
    
    var body: some View {
        VStack {
            List(viewModel.positions) { position in
                PositionCell(position: position)
            }
            .listStyle(.plain)
        .navigationTitle("Cart")
            
            HStack {
                Text("Total price")
                    .fontWeight(.bold)
                Spacer()
                Text("$ \(self.viewModel.cost)")
                    .fontWeight(.bold)
            }.padding()
        }
        
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel.shared)
    }
}
