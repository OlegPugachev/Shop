
import Foundation

enum OrderStatus: String, CaseIterable {
    case new = "New"
    case prepare = "Prepare"
    case delivery = "Delivery"
    case completed = "Completed"
    case cancelled = "Cancelled"
}
