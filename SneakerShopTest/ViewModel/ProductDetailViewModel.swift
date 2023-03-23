//
//  ProductDetailViewModel.swift
//  SneakerShopTest
//
//  Created by Андрей Барсуков on 19.03.2023.
//

import Foundation
import UIKit

class ProductDetailViewModel: ObservableObject {
    
    @Published var product: Product
    @Published var colors = ["white", "gray", "black"]
    @Published var count = 0
    @Published var image = UIImage(named: "copyIPhone")!
    
    init(product: Product) {
        self.product = product
    }
    
    func getPrice(color: String) -> Int {
        switch color {
        case "white": return Int(product.price)
            
        case "gray": return Int(Double(product.price) * 1.1)
            
        case "black": return Int(Double(product.price) * 1.15)
        default: return 0
        }
    }
    
    func getImage() {
        StorageService.shared.downloadProductImage(id: product.id) { result in
            switch result {
            case .success(let data):
                if let image = UIImage(data: data) {
                    self.image = image
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
