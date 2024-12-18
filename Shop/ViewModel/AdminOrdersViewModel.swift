
import Foundation

class AdminOrdersViewModel: ObservableObject {
    @Published var orders = [Order]()
    var currentOrder = Order(userId: "", date: Date(), status: "New")
    
    func getOrders() {
        DataBaseService.shared.getOrders(by: nil) { result in
            switch result {
                case .success(let orders):
                    self.orders = orders
                    self.getPositions()
                case .failure(let error):
                    dump(error.localizedDescription)
            }
        }
    }
    
    func getPositions() {
        for (index, order) in self.orders.enumerated() {
            DataBaseService.shared.getPositions(by: order.id) { result in
                switch result {
                    case .success(let positions):
                        self.orders[index].positions = positions
                        dump(self.orders[index].cost)
                    case .failure(let error):
                        dump("getPositions method error: \(error.localizedDescription)")
                }
            }
        }
    }
    
}

