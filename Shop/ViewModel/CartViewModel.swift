
import Foundation

class CartViewModel: ObservableObject {
    @Published var positions: [Position] = []
    
    func addPosition(_ position: Position) {
        self.positions.append(position)
    }
}
