//
//  Position.swift
//  SneakerShopTest
//
//  Created by Андрей Барсуков on 20.03.2023.
//

import Foundation

struct Position: Identifiable {
    var id: String
    var product: Product
    var count: Int
    
    var cost: Int {
        return Int(product.price) * self.count
    }
}
