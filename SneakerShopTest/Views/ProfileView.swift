//
//  ProfileView.swift
//  SneakerShopTest
//
//  Created by Андрей Барсуков on 17.03.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @State var isAvatarActionPresented = false
    @State var isQuitAlertPresented = false
    @State var isAuthViewPresented = false
    
    var body: some View {
        VStack {
            HStack {
                Button() {
                    print("Nothing")
                } label: {
                    Image(systemName: "arrow.left")
                }
                
                Spacer()
                
                Text("Profile")
                    .font(.title2.bold())
                    .padding(.trailing, 150)
            }.padding(.horizontal)
            Image("i")
                .resizable()
                .frame(width: 100, height: 120)
                .clipShape(Circle())
                
            Button {
                print("Change Photo")
            } label: {
                Text("Change photo")
                    .foregroundColor(.gray)
                    .onTapGesture {
                        isAvatarActionPresented.toggle()
                    }
            }
            .confirmationDialog("Change photo", isPresented: $isAvatarActionPresented) {
                Button {
                    print("Gallery")
                } label: {
                    Text("Photo gallery")
                }
                Button {
                    print("Camera")
                } label: {
                    Text("Camera")
                }

            }
            
            
            Text("Name Second Name")
                .font(.title2.bold())
                .padding(.top, 15)
            
            Button {
                print("Nothing")
            } label: {
                Text("\(Image(systemName: "square.and.arrow.up")) Upload item")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("backLogin"))
                    .cornerRadius(20)
                    .padding(.horizontal, 35)
                    .padding(.vertical, 10)
                    .font(.title3.bold())
                    .foregroundColor(.white)
            }
            VStack {
                Button {
                    print("Nothing")
                } label: {
                    Text("\(Image(systemName: "folder")) Trade store                                        \(Image(systemName: "arrow.right"))")
                }.foregroundColor(.black)
                    .padding(7)

                Button {
                    print("Nothing")
                } label: {
                    Text("\(Image(systemName: "folder")) Payment method                              \(Image(systemName: "arrow.right"))")
                }.foregroundColor(.black)
                    .padding(7)
                
                Button {
                    print("Nothing")
                } label: {
                    Text("\(Image(systemName: "folder")) Balance                                       $ 1593")
                }.foregroundColor(.black)
                    .padding(7)
                
                Button {
                    print("Nothing")
                } label: {
                    Text("\(Image(systemName: "folder")) Trade history                                     \(Image(systemName: "arrow.right"))")
                }.foregroundColor(.black)
                    .padding(7)
                
                Button {
                    print("Nothing")
                } label: {
                    Text("\(Image(systemName: "arrow.clockwise.circle")) Restore Purchase                              \(Image(systemName: "arrow.right"))")
                }.foregroundColor(.black)
                    .padding(7)
                
                Button {
                    print("Nothing")
                } label: {
                    Text("\(Image(systemName: "questionmark")) Help                                                     \(Image(systemName: "arrow.right"))")
                }.foregroundColor(.black)
                    .padding(7)
                
                Button {
                    isQuitAlertPresented.toggle()
                } label: {
                    Text("\(Image(systemName: "arrow.left.circle")) Log out                                               \(Image(systemName: "arrow.right"))")
                }.foregroundColor(.black)
                    .padding(7)
                    .confirmationDialog("Log out", isPresented: $isQuitAlertPresented, titleVisibility: .visible) {
                        Button {
                            isAuthViewPresented.toggle()
                        } label: {
                            Text("Yes")
                        }
                    }
                    .fullScreenCover(isPresented: $isAuthViewPresented,onDismiss: nil) {
                        AuthView()
                    }
            }
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
