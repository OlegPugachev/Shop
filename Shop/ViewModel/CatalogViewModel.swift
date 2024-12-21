
import Foundation

class CatalogViewModel: ObservableObject {
    static let shared = CatalogViewModel()
    
    //private init() {}
    
    var popularProducts: [Product] = [
        Product(id: "1", title: "iPhone 16 Pro Max", imageUrl: "iphone16", price: 999, description: "Titanium design with larger 6.3-inch Super Retina XDR display, durable latest-generation Ceramic Shield, Action button, and USB-C with USB 3 speeds"),
        Product(id: "2", title: "iPhone 15 Pro Max", imageUrl: "iphone15", price: 699, description: "6.1-inch durable color-infused glass and aluminum design with Ceramic Shield front"),
        Product(id: "3", title: "iPhone 14 Pro Max", imageUrl: "iphone14", price: 599, description: "6.1-inch durable design with Ceramic Shield and water and dust resistance"),
        Product(id: "4", title: "iPhone SE", imageUrl: "iphonese", price: 429, description: "4.7-inch Retina HD display that’s bright, colorful, and sharp")
    ]
    
    @Published var products: [Product] = [
        Product(id: "1", title: "iPhone 16 Pro Max", imageUrl: "iphone16", price: 999, description: "Titanium design with larger 6.3-inch Super Retina XDR display, durable latest-generation Ceramic Shield, Action button, and USB-C with USB 3 speeds"),
        Product(id: "2", title: "iPhone 15 Pro Max", imageUrl: "iphone15", price: 699, description: "6.1-inch durable color-infused glass and aluminum design with Ceramic Shield front"),
        Product(id: "3", title: "iPhone 14 Pro Max", imageUrl: "iphone14", price: 599, description: "6.1-inch durable design with Ceramic Shield and water and dust resistance"),
        Product(id: "4", title: "iPhone SE", imageUrl: "iphonese", price: 429, description: "4.7-inch Retina HD display that’s bright, colorful, and sharp"),
        
        
        Product(id: "5", title: "iPhone 16 Pro Max", imageUrl: "iphone16", price: 999, description: "Titanium design with larger 6.3-inch Super Retina XDR display, durable latest-generation Ceramic Shield, Action button, and USB-C with USB 3 speeds"),
        Product(id: "6", title: "iPhone 15 Pro Max", imageUrl: "iphone15", price: 699, description: "6.1-inch durable color-infused glass and aluminum design with Ceramic Shield front"),
        Product(id: "7", title: "iPhone 14 Pro Max", imageUrl: "iphone14", price: 599, description: "6.1-inch durable design with Ceramic Shield and water and dust resistance"),
        Product(id: "8", title: "iPhone SE", imageUrl: "iphonese", price: 429, description: "4.7-inch Retina HD display that’s bright, colorful, and sharp")
        
    ]
    
    func getProducts() {
        DataBaseService.shared.getProducts { products in
            switch products {
                case .success(let products):
                    self.products = products
                    dump("getProducts success, count: \(products.count)")
                case .failure(let error):
                    dump("getPruoucts error: \(error.localizedDescription)")
            }
        }
    }
}
