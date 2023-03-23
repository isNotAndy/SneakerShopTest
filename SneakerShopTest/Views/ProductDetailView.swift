//
//  ProductDetailView.swift
//  SneakerShopTest
//
//  Created by Андрей Барсуков on 19.03.2023.
//

import SwiftUI

struct ProductDetailView: View {
    
    @State var viewModel: ProductDetailViewModel 
    @State var color = "white"
    @State var count = 1
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Image(uiImage: self.viewModel.image)
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 360)
                HStack {
                    Text("\(viewModel.product.title)")
                        .font(.title.bold())
                    
                        Spacer()
                    
                    Text("$ \(viewModel.getPrice(color: self.color))")
                        .font(.title3)
                        .bold()
                }.padding(.horizontal)
                
                Text("\(viewModel.product.descript)")
                    .padding(.horizontal)
                    .padding(.top, 5)

                
                Picker("Color", selection: $color) {
                    ForEach(viewModel.colors, id: \.self) { item in
                        Text(item)
                    }
                }.pickerStyle(.segmented)
                    .padding(.trailing, 180)
                    .padding(.top, 100)

                HStack {
                    VStack {
                        Stepper("quantity", value: $count,in: 1...10)
                        Text("\(self.count)")
                            .padding(.leading, 75)
                    }
                    Button {
                        var position = Position(id: UUID().uuidString,
                                                product: viewModel.product,
                                                count: self.count)
                        
                        position.product.price = viewModel.getPrice(color: color)
                        
                        CartViewModel.shared.addPosition(position)
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("ADD TO CART")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("backLogin"))
                            .cornerRadius(20)
                            .padding(.horizontal, 35)
                            .padding(.vertical, 10)
                            .font(.title2.bold())
                            .foregroundColor(.black)
                    }
                }.padding()
                
            }
            .onAppear {
                self.viewModel.getImage()
            }
            
            Spacer()
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(viewModel: ProductDetailViewModel(product: Product(
                    id: "1",
                    title: "IPhone",
                    imageUrl: "NF",
                    price: 450,
                    descript: "phone")))
    }
}
