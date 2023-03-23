//
//  AdminOrdersView.swift
//  SneakerShopTest
//
//  Created by Андрей Барсуков on 22.03.2023.
//

import SwiftUI

struct AdminOrdersView: View {
    
    @State private var isShowAuthView = false
    @State private var isShowAddProductView = false
    
    var body: some View {
        HStack {
            Button {
                AuthService.shared.signOut()
                isShowAuthView.toggle()
            } label: {
                Text("Out")
            }
            
            
            Button {
                isShowAddProductView.toggle()
            } label: {
                Text("Add product")
            }
            .sheet(isPresented: $isShowAddProductView) {
                AddProductView()
            }
        }.fullScreenCover(isPresented: $isShowAuthView) {
            AuthView()
        }

    }
}

struct AdminOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        AdminOrdersView()
    }
}
