
import Foundation

class CartViewModel: ObservableObject {
    
    @Published var positions: [Position] = []
    static let shared = CartViewModel()
    private init() {}
    
    var totalCost: Double {
        var sum: Double = 0
        for pos in positions {
            sum += pos.cost
        }
        return sum
        
        //positions.reduce(0) { $0 + $1.cost }
    }
    
    func addPosition(_ position: Position) {
        self.positions.append(position)
    }
}
