//
//  ProductDetailView.swift
//  Shop
//
//  Created by Oleg on 12.12.2024.
//

import SwiftUI

struct ProductDetailView: View {
    
    var product: Product
    
    var body: some View {
        Text("\(product.title)")
    }
}

#Preview {
    ProductDetailView(product: Product(id: "1", title: "notebook", imageUrl: "Not found", price: 3, description: "notebook Description"))
}
