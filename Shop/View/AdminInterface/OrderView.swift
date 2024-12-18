
import SwiftUI

struct OrderView: View {
    
    @StateObject var     viewModel: OrderViewModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
            Text("\(viewModel.user.name)")
                .font(.title3).bold()
            Text("\(viewModel.user.phone)").bold()
            Text("\(viewModel.user.address)")
            
            List {
                ForEach(viewModel.order.positions, id: \.id) { position in
                    PositionCell(position: position)
                }
                Text("Total: \(viewModel.order.cost) $").bold()
            }
        }.padding()
            .onAppear() {
                viewModel.getUserData()
            }
    }
}

#Preview {
    OrderView(viewModel: OrderViewModel(order: Order(id: "", userId: "", date: Date(), status: "New")))
}
