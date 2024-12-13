
import Foundation

enum memorySize: String, CaseIterable {
    case Gb256 = "256 Gb"
    case Gb512 = "512 Gb"
    case TB1 = "1 TB"
    
    func getPrice(price: Double) -> Double {
        switch self {
            case .Gb256 : return price
            case .Gb512 : return price * 1.1
            case .TB1 : return price * 1.29
        }
    }
}

class ProductDetailViewModel: ObservableObject {
    
    @Published var product: Product
    @Published var count = 0
    
    init(product: Product) {
        self.product = product
    }
}
