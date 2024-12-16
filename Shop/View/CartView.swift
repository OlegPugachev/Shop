
import SwiftUI

struct CartView: View {
    
    @StateObject var viewModel: CartViewModel
    
    var body: some View {
        VStack {
            List(viewModel.positions) { position in
                PositionCell(position: position)
                    .swipeActions {
                        Button {
                            viewModel.positions.removeAll(where: { $0.id == position.id })
                        } label: {
                            Text("Remove")
                        }.tint(.red)
                    }
            }
            .listStyle(.plain)
            .navigationTitle("Card")
            
            HStack {
                Text("Total cost: ")
                Spacer()
                    .fontWeight(.bold)
                Text(String( format: "%.2f", self.viewModel.totalCost) + " $")
                    .fontWeight(.bold)
            }.padding()
            
            HStack {
                Button {
                    
                } label: {
                    Text("Cancel")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .background(.red)
                        .cornerRadius(12)
                }
                
                Button {
                    dump("Order")
                    var order = Order(userId: AuthService.shared.currentUser!.uid, date: Date(), status: OrderStatus.new.rawValue)
                    
                    order.positions = self.viewModel.positions
                    DataBaseService.shared.setOrder(order: order) { result in
                        switch result {
                            case .success(let order):
                                dump(order.cost)
                            case .failure(let error):
                                dump("Order failed:" + error.localizedDescription)
                        }
                    }
                    
                } label: {
                    Text("Order")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .background(.green)
                        .cornerRadius(12)
                        .padding(.leading, 15)
                }
            }.padding()
            
        }
    }
}

#Preview {
    CartView(viewModel: CartViewModel.shared)
}
