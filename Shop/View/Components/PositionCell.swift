
import SwiftUI

struct PositionCell: View {
    
    let position: Position
    
    var body: some View {
        HStack {
            Text(position.product.title)
                .fontWeight(.bold)
            Spacer()
            Text("\(position.count) pc")
            Text(String(format: "%.2f", position.product.price) + " $")
                .frame(width: 85, alignment: .trailing)
        }.padding(.horizontal)
    }
}

#Preview {
    PositionCell(position: Position(
        id: UUID().uuidString,
        product: Product(id: UUID().uuidString,
                         title: "iPhone 16 Pro Max",
                         imageUrl: "Not found",
                         price: 999,
                         description: "Titanium design with larger 6.3-inch Super Retina XDR display, durable latest-generation Ceramic Shield, Action button, and USB-C with USB 3 speeds"), count: 3 ))
}
