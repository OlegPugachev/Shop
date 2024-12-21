
import Foundation

struct Product {
    
    var id: String
    var title: String
    var imageUrl: String
    var price: Double
    var description: String
    
//    var ordersCount: Int
//    var isRecommend: Bool
    
    var representation: [String: Any] {
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["title"] = self.title
        repres["imageUrl"] = self.imageUrl
        repres["price"] = self.price
        repres["description"] = self.description
        return repres
    }
}
