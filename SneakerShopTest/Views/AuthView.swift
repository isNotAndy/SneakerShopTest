//
//  ContentView.swift
//  SneakerShopTest
//
//  Created by Андрей Барсуков on 16.03.2023.
//

import SwiftUI

struct AuthView: View {
    /// true - экран авторизации, false - экран регистрации
    @State private var isAuth = true
    
    @State private var firstName = ""
    @State private var password = ""
    @State private var email = ""
    
    @State private var isShowAllert = false
    @State private var alertMessage = ""
    
    /// Отвечает за показ TabBar
    @State private var isTabBarShow = false
    
    var body: some View {
        VStack {
            Text(isAuth ? "Welcome Back" : "Sign in")
                .padding(50)
                .padding(.horizontal, 30)
                .font(.title.bold())
            
            VStack {
                
                TextField("Email", text: $email)
                    .padding()
                    .background(Color("buttonSgnInColor"))
                    .cornerRadius(20)
                    .padding(.horizontal, 35)
                    .padding(.vertical, 10)
                
                if !isAuth{
                    TextField("Name", text: $firstName)
                        .padding()
                        .background(Color("buttonSgnInColor"))
                        .cornerRadius(20)
                        .padding(.horizontal, 35)
                        .padding(.vertical, 10)
                }
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color("buttonSgnInColor"))
                    .cornerRadius(20)
                    .padding(.horizontal, 35)
                    .padding(.vertical, 10)
                
                Button {
                    if isAuth {
                        print("Авторизация")
                        
                        AuthService.shared.signIn(email: self.email,
                                                  password: self.password) { result in
                            switch result {
                            case .success(let user):
                                isTabBarShow.toggle()
                            case .failure(let error):
                                alertMessage = "Error auth: \(error.localizedDescription)"
                                isShowAllert.toggle()
                            }
                        }
                        
                    } else {
                        print("Регистрация")
                        
                        AuthService.shared.signUp(email: self.email, password: self.password) { result in
                            switch result {
                                
                            case .success(let user):
                                alertMessage = "\(user.email!) successfully registered"
                                self.isShowAllert.toggle()
                                self.firstName = ""
                                self.password = ""
                                self.email = ""
                                self.isAuth.toggle()
                            case .failure(let error):
                                alertMessage = "\(error.localizedDescription)"
                                self.isShowAllert.toggle()
                            }
                        }
                    }
                } label: {
                    Text(isAuth ? "Login" : "Sing in")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("backLogin"))
                        .cornerRadius(20)
                        .padding(.horizontal, 35)
                        .padding(.vertical, 10)
                        .font(.title3.bold())
                        .foregroundColor(.white)
                }
                
                Button {
                    isAuth.toggle()
                } label: {
                    Text(isAuth ? "Don't have an account ?" : "Already have an account?")
                        .multilineTextAlignment(.trailing)
                        .frame(maxWidth: .infinity)
                        .font(.title3)
                        .foregroundColor(.gray)
                      
                }
                
                if !isAuth{
                    Button {
                        print("Apple")
                    } label: {
                        HStack{
                            Text(Image(systemName: "apple.logo"))
                                .padding(5)
                                .font(.title3)
                                .foregroundColor(.black)
                            
                            Text("Sign in with apple")
                                .padding(5)
                                .font(.title3)
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.top, 50)
                    
                    Button {
                        print("Google")
                    } label: {
                        HStack{
                            Text(Image(systemName: "g.square"))
                                .padding(5)
                                .padding(.trailing, -5)
                                .font(.title3)
                                .foregroundColor(.black)
                            
                            Text("Sign in with Google")
                                .padding(5)
                                .font(.title3)
                                .foregroundColor(.black)
                        }
                        .padding(.leading, 10)
                    }
                }
                
            }
            .alert(alertMessage, isPresented: $isShowAllert) {
                Button { } label: {
                    Text("OK")
                }

            }
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("back").ignoresSafeArea())
            .animation(Animation.easeOut(duration: 0.8), value: isAuth)
        /// когда isTabBarShow - true, покажется MainTabBar
            .fullScreenCover(isPresented: $isTabBarShow) {
                
                var mainTabBarViewModel = MainTabBarViewModel(user: AuthService.shared.currentUser!)
                
                MainTabBar(viewModel: mainTabBarViewModel)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
