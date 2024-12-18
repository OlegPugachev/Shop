
import Foundation

class ProfileViewModel: ObservableObject {
    @Published var profile: UserModel
    @Published var orders: [Order] = [Order]()
    
    init(profile: UserModel) {
        self.profile = profile
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
    
    func getOrders() {
        DataBaseService.shared.getOrders (by: AuthService.shared.currentUser?.accessibilityHint) { result in
            switch result {
                case .success(let orders):
                    self.orders = orders
                    self.getPositions()
//                    for (index, order) in self.orders.enumerated() {
//                        DataBaseService.shared.getPositions(by: order.id) { result in
//                            switch result {
//                                case .success(let positions):
//                                    self.orders[index].positions = positions
//                                    dump(self.orders[index].cost)
//                                case .failure(let error):
//                                    dump("getPositions method error: \(error.localizedDescription)")
//                            }
//                        }
//                    }
                    
                    dump("Total orders: \( orders.count)")
                case .failure(let error):
                    dump("getOrders method error: \(error.localizedDescription)")
            }
        }
    }
    
    func setProfile() {
        DataBaseService.shared.setProfile(user: self.profile) { result in
            switch result {
                    
                case .success(let user):
                    dump("setProfile \( user.name)")
                case .failure(let error):
                    dump("setProfile method error: \(error.localizedDescription)")
            }
        }
    }
    
    func getProfile() {
        DataBaseService.shared.getProfile { result in
            switch result {
                case .success(let user):
                    self.profile = user
                    dump("getProfile \( user.name)")
                case .failure(let error):
                    dump("getProfile method error: \(error.localizedDescription)")
            }
        }
    }
}
