//
//  MainTabBar.swift
//  SneakerShopTest
//
//  Created by Андрей Барсуков on 17.03.2023.
//

import SwiftUI

struct MainTabBar: View {
    
    var viewModel: MainTabBarViewModel
    
    var body: some View {
        TabView {
            NavigationView {
                Page1View()
            }
                .tabItem {
                    VStack{
                        Image(systemName: "house")
                    }
                }
            
            Text("")
                .tabItem {
                    VStack{
                        Image(systemName: "heart")
                    }
                }
            
            CartView(viewModel: CartViewModel.shared)
                .tabItem {
                    VStack{
                        Image(systemName: "cart.fill")
                    }
                }
            
            Text("")
                .tabItem {
                    VStack{
                        Image(systemName: "bubble.left")
                    }
                }
            NavigationView {
                ProfileView()
            }
                .tabItem {
                    VStack{
                        Image(systemName: "person")
                    }
                }
        }
    }
}
