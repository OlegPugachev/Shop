
import Foundation

class OrderViewModel: ObservableObject {
    @Published var order: Order
    @Published var user = UserModel(id: "", name: "", phone: 0, address: "")
    
    init(order: Order) {
        self.order = order
    }
    
    func getUserData() {
        DataBaseService.shared.getProfile(by: order.userId) { user in
            switch user {
                case .success(let user):
                    self.user = user
                case .failure(let error):
                    dump(error.localizedDescription)
            }
        }
    }
}
