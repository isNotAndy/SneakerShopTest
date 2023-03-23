//
//  Page1ViewModel.swift
//  SneakerShopTest
//
//  Created by Андрей Барсуков on 18.03.2023.
//

import Foundation

class CatalogViewModel: ObservableObject {
    
    static let shared = CatalogViewModel()
    
    var latest = [
        Product(id: "1",
                title: "IPhone",
                imageUrl: "NF",
                price: 450,
                descript: "phone"),
        Product(id: "2",
                title: "Kids",
                imageUrl: "NF",
                price: 450,
                descript: "phone"),
        Product(id: "3",
                title: "IPhone",
                imageUrl: "NF",
                price: 450,
                descript: "phone"),
        Product(id: "4",
                title: "IPhone",
                imageUrl: "NF",
                price: 450,
                descript: "phone"),
        Product(id: "5",
                title: "IPhone",
                imageUrl: "NF",
                price: 450,
                descript: "phone")
    ]
    
    @Published var flashSale = [
        Product(id: "1",
                title: "IPhone",
                imageUrl: "NF",
                price: 450,
                descript: "phone"),
        Product(id: "2",
                title: "Kids",
                imageUrl: "NF",
                price: 450,
                descript: "phone"),
        Product(id: "3",
                title: "IPhone",
                imageUrl: "NF",
                price: 450,
                descript: "phone"),
        Product(id: "4",
                title: "IPhone",
                imageUrl: "NF",
                price: 450,
                descript: "phone"),
        Product(id: "5",
                title: "IPhone",
                imageUrl: "NF",
                price: 450,
                descript: "phone")
    ]
    
    func getProducts() {
        DataBaseService.shared.getProducts { result in
            switch result {
            case .success(let products):
                self.flashSale = products
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
