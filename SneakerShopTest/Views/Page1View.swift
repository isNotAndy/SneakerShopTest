//
//  Page1.swift
//  SneakerShopTest
//
//  Created by Андрей Барсуков on 17.03.2023.
//

import SwiftUI

struct Page1View: View {
    
    let layout = [GridItem(.adaptive(minimum: screen.width / 2.2))]
    @StateObject var viewModel = CatalogViewModel()
    @State private var search = ""
    
    var body: some View {
        VStack{
            
            HStack{
                Button(action: {}) {
                    Image(systemName: "menucard")
                        .font(.title)
                        .foregroundColor(.black)
                        .padding()
                }
                Spacer()
                Text("Trade by bata")
                    .font(.title2)
                    .bold()
                    .padding()
                Spacer()
                VStack {
                    Image("i")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .padding(.trailing)
                    
                    Text("Location")
                        .font(.caption2)
                        .padding(.trailing)
                }
            }
            
            TextField("What are you looking for?" , text: $search)
                .padding()
                .background(Color("buttonSgnInColor"))
                .cornerRadius(15)
                .padding(.horizontal, 35)
                .padding(.vertical, 5)
            
            ScrollView(.vertical, showsIndicators: false) {
                Section("Latest") {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: layout) {
                            ForEach(CatalogViewModel.shared.latest, id: \.id) { item in
                                NavigationLink {
                                    
                                    let viewModel = ProductDetailViewModel(product: item)
                                    
                                    ProductDetailView(viewModel: viewModel)
                                } label: {
                                    ProductCell(product: item)
                                        .foregroundColor(.white)
                                }
                                
                                
                            }
                        }
                    }
                }
                
                Section("Flash sale") {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: layout) {
                            ForEach(viewModel.flashSale, id: \.id) { item in
                                NavigationLink {
                                    let viewModel = ProductDetailViewModel(product: item)
                                    
                                    ProductDetailView(viewModel: viewModel)
                                } label: {
                                    ProductCell(product: item)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                }
                
            }.navigationBarHidden(true)
                .onAppear {
                    self.viewModel.getProducts()
                }
        }
    }
}

struct Page1_Previews: PreviewProvider {
    static var previews: some View {
        Page1View()
    }
}
