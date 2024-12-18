
import SwiftUI

struct OrderCell: View {
    //@State var order: Order = Order(userId: "", date: Date(), status: "New")
    var order: Order
    
    var body: some View {
        HStack {
            Text("\(order.date)")
            Text(String(format: "%.2f", order.cost))
                .bold()
                .frame(width: 90)
            Text("\(order.status)")
                .frame(width: 100)
                .foregroundColor(.green)
        }
    }
}

//#Preview {
//    OrderCell()
//}
