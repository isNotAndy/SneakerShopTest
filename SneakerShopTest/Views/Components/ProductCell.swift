//
//  ProductCell.swift
//  SneakerShopTest
//
//  Created by Андрей Барсуков on 17.03.2023.
//

import SwiftUI

struct ProductCell: View {
    
    var product: Product
    @State var uiImage = UIImage(named: "copyIPhone")

    
    var body: some View {

        ZStack {
            Image(uiImage: uiImage!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: screen.width * 0.45)
                .clipped()
                .cornerRadius(16)
            VStack{
                Text(product.descript)
                    .padding(3)
                    .font(.caption)
                    .foregroundColor(.white)
                    .background(.gray)
                    .cornerRadius(12)
                Text(product.title)
                    .font(.title3)
                    .foregroundColor(.white)
                
                
                Text("$ \(product.price)")
                    .font(.custom("AvenirNext-bold", size: 12))
                    .foregroundColor(Color.white)
                    .padding(.bottom)
            }
            .padding(.trailing, 100)
            .padding(.top, 145)
            
            Button {
                print("Noth")
            } label: {
                Image(systemName: "plus")
            }
            .foregroundColor(.black)
            .padding(.leading, 2)
            .background(.gray)
            .cornerRadius(13)
            .padding(.leading, 140)
            .padding(.top, 190)
            
            
        }.frame(width: screen.width * 0.45, height: screen.width * 0.55)
            .onAppear  {
                StorageService.shared.downloadProductImage(id: self.product.id) { result in
                    switch result {
                    case .success(let data):
                        if let img = UIImage(data: data) {
                            self.uiImage = img
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(product: Product(id: "1",
                                     title: "IPhone",
                                     imageUrl: "NF",
                                     price: 450,
                                     descript: "phone"))
    }
}
