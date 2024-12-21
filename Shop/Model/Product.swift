
import Foundation
import FirebaseFirestore

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
    
    internal init(id: String = UUID().uuidString,
         title: String,
         imageUrl: String = "",
         price: Double,
         description: String) {
        self.id = id
        self.title = title
        self.imageUrl = imageUrl
        self.price = price
        self.description = description
    }
    
    init?(doc: QueryDocumentSnapshot) {
        let data = doc.data()
        guard let id = data["id"] as? String else { return nil }
        guard let title = data["title"] as? String else { return nil }
        guard let price = data["price"] as? Double else {
            dump(data["price"])
            return nil
        }
        guard let description = data["description"] as? String else { return nil }
        guard let imageUrl = data["imageUrl"] as? String else { return nil }
        
        self.id = id
        self.title = title
        self.imageUrl = imageUrl
        self.price = Double(price)
        self.description = description
        
    }
}
