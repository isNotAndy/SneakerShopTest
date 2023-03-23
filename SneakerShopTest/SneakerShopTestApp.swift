//
//  SneakerShopTestApp.swift
//  SneakerShopTest
//
//  Created by Андрей Барсуков on 16.03.2023.
//

import SwiftUI
import Firebase
import FirebaseAuth

let screen = UIScreen.main.bounds

@main
struct SneakerShopTestApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    var body: some Scene {
        WindowGroup {
            if let user = AuthService.shared.currentUser {
                if user.uid == "xaxFjqOdUlfWJAo6v7ygT1vXBki1" {
                    AdminOrdersView()
                } else {
                    let viewModel = MainTabBarViewModel(user: user)
                    MainTabBar(viewModel: viewModel)
                }
            } else {
                AuthView()
            }
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate {
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            
            FirebaseApp.configure()
            
            return true
        }
        
    }
    
}
