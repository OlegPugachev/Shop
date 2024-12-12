//
//  ProductCell.swift
//  Shop
//
//  Created by Oleg on 12.12.2024.
//

import SwiftUI

struct ProductCell: View {
    var product: Product
    
    var body: some View {
        VStack(spacing: 2) {
            Image("notebookPH")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width * 0.45)
                //.clipped()
                //.cornerRadius(16)
            
            HStack{
                Text(product.title)
                    .font(.custom("AvenirNext-regular", size: 14))
                Spacer()
                Text(String(format: "%.2f", product.price) + " £")
                    .font(.custom("AvenirNext-bold", size: 14))
            }
            .padding(.horizontal, 6)
            .padding(.bottom, 6)
            
        }.frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.width * 0.55 )
            //.background(.white)
            .cornerRadius(16)
            .shadow(radius: 4)
    }
}

#Preview {
    ProductCell(product: Product(id: "1", title: "notebook", imageUrl: "Not found", price: 3, description: "notebook Description"))
}
