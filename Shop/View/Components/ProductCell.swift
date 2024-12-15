
import SwiftUI

struct ProductCell: View {
    var product: Product
    
    var body: some View {
        VStack(spacing: 2) {
            Image(product.imageUrl)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width * 0.45)
                //.clipped()
                //.cornerRadius(16)
            
            HStack{
                Text(product.title)
                    .font(.custom("AvenirNext-regular", size: 14))
                Spacer()
                Text(String(format: "%.2f", product.price) + " $")
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
    ProductCell(product:  Product(id: "1", title: "iPhone 16 Pro Max", imageUrl: "Not found", price: 999, description: "Titanium design with larger 6.3-inch Super Retina XDR display, durable latest-generation Ceramic Shield, Action button, and USB-C with USB 3 speeds"))
}
