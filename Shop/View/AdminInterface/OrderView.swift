
import SwiftUI

struct OrderView: View {
    
    @StateObject var     viewModel: OrderViewModel
    
    var statuses: [String] {
        var statuses = [String]()
        for status in OrderStatus.allCases {
            statuses.append(status.rawValue)
        }
        return statuses
    }
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
            Text("\(viewModel.user.name)")
                .font(.title3).bold()
            Text("\(viewModel.user.phone)").bold()
            Text("\(viewModel.user.address)")
            
        }.padding()
            .onAppear() {
                viewModel.getUserData()
            }
        
        Picker(selection: $viewModel.order.status) {
            ForEach(statuses, id: \.self) { status in
                Text(status)
            }
        } label: {
            Text("Status")
        }
        .pickerStyle(.segmented)
        .onChange(of: viewModel.order.status) { oldValue, newValue in
            dump("order status changed: \(newValue)")
            DataBaseService.shared.setOrder(order: viewModel.order) { result in
                switch result {
                    case .success(let order):
                        dump(order.status)
                    case .failure(let error):
                        dump(error.localizedDescription)
                }
            }
        }
        
        List {
            ForEach(viewModel.order.positions, id: \.id) { position in
                PositionCell(position: position)
            }
            Text("Total: " + String(format: "%.2f", viewModel.order.cost) + " $").bold().padding(.leading, 15)
        }
    }
}

#Preview {
    OrderView(viewModel: OrderViewModel(order: Order(id: "", userId: "", date: Date(), status: "New")))
}
