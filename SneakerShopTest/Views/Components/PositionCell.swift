//
//  PositionCell.swift
//  SneakerShopTest
//
//  Created by Андрей Барсуков on 20.03.2023.
//

import SwiftUI

struct PositionCell: View {
    
    let position: Position
    
    var body: some View {
        HStack {
            Text(position.product.title)
                .fontWeight(.bold)
            Spacer()
            Text(" \(position.count)")
            Text("$ \(position.cost)")
                .frame(width: 85, alignment: .trailing)
        }.padding(.horizontal)
    }
}

struct PositionCell_Previews: PreviewProvider {
    static var previews: some View {
        PositionCell(
            position: Position(id: UUID().uuidString, product: Product(id: UUID().uuidString,
                        title: "IPhone",
                        imageUrl: "copyIPhone",
                        price: 350,
                        descript: "copy iphone"),
                        count: 3)
        )
    }
}
