
import SwiftUI

struct AdminOrdersView: View {
    
    @StateObject var viewModel = AdminOrdersViewModel()
    @State var isOrderViewShow = false
    @State var isShowAuthView = false
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    AuthService.shared.signOut()
                    isShowAuthView.toggle()
                } label: {
                    Text("Sign Out")
                        .foregroundColor(.red)
                }
                Spacer()
                Button {
                    dump("add order")
                } label: {
                    Text("Add position")
                        .foregroundColor(.green)
                }
                Spacer()
                Button {
                    viewModel.getOrders()
                } label: {
                    Text("Refresh")
                }
            }.padding()
            List {
                ForEach(viewModel.orders, id: \.id) { order in
                    OrderCell(order: order)
                        .onTapGesture {
                            viewModel.currentOrder = order
                            isOrderViewShow.toggle()
                        }
                }
            }
            .listStyle(.plain)
            .onAppear() {
                viewModel.getOrders()
            }
            .sheet(isPresented: $isOrderViewShow)   {
                let orderViewModel = OrderViewModel(order: viewModel.currentOrder)
                OrderView(viewModel: orderViewModel)
            }
        }
        .fullScreenCover(isPresented: $isShowAuthView) {
            AuthView()
        }
    }
}

#Preview {
    AdminOrdersView()
}
