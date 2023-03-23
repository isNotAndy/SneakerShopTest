//
//  DataBaseService.swift
//  SneakerShopTest
//
//  Created by Андрей Барсуков on 22.03.2023.
//

import Foundation
import FirebaseFirestore

class DataBaseService {
    
    static let shared = DataBaseService()
    private let db = Firestore.firestore()
    
    private var usersRef: CollectionReference { db.collection("users") }
    private var ordersRef: CollectionReference { db.collection("orders") }
    private var productsRef: CollectionReference { db.collection("products") }
    
    private init() { }
    
    func setUser(user: MWUser, completion: @escaping (Result<MWUser, Error>) -> ()) {
    
        usersRef.document(user.id).setData(user.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
        
    }
    
    func getProducts(completion: @escaping (Result <[Product], Error>) -> ()) {
        
        self.productsRef.getDocuments { qSnap, error in
            guard let qSnap = qSnap else {
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
            let docs = qSnap.documents
            
            var products = [Product]()
            
            for doc in docs {
                guard let product = Product(doc: doc) else { return }
                products.append(product)
            }
            completion(.success(products))
        }
    }
    
    func setProduct(product: Product, image: Data, completion: @escaping (Result<Product, Error>) -> ()) {
        
        StorageService.shared.upload(id: product.id, image: image) { result in
            switch result {
            case .success(let sizeInfo):
                print(sizeInfo)
                
                self.productsRef.document(product.id).setData(product.representation) { error in
                    if let error = error {
                        completion(.failure(error))
                    } else {
                        completion(.success(product))
                    }
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
    
}
