//
//  MWUser.swift
//  SneakerShopTest
//
//  Created by Андрей Барсуков on 22.03.2023.
//

import Foundation

struct MWUser: Identifiable {
    
    var id: String
    var name: String
    var wallet: Int
    var address: String
    
    var representation: [String: Any] {
        
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["name"] = self.name
        repres["wallet"] = self.wallet
        repres["address"] = self.address
        
        return repres
    }
}
