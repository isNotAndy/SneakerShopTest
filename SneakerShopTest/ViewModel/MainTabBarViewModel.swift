//
//  MainTabBarViewModel.swift
//  SneakerShopTest
//
//  Created by Андрей Барсуков on 22.03.2023.
//

import Foundation
import FirebaseAuth

class MainTabBarViewModel: ObservableObject {
    
    @Published var user: User
    
    init(user: User) {
        self.user = user 
    }
    
}
