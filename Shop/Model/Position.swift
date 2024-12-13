
import Foundation

struct Position {
    var id: String
    var product: Product
    var count: Int
    
    var cost: Double {
        return product.price * Double(self.count)
    }
}
