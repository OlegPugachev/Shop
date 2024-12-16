
import Foundation
import FirebaseFirestore

struct Order {
    
    var id: String = UUID().uuidString
    var userId: String
    var positions: [Position] = [Position]()
    var date: Date
    var status: String
    
    var cost: Double {
        var sum = 0.0
//        for position in positions {
//            sum += position.cost
//        }
        sum = positions.reduce(0) { $0 + $1.cost }
        return sum
    }
    
    var representation: [String: Any] {
        
        var repres = [String: Any]()
        repres["id"] = id
        repres["userId"] = userId
        repres["date"] = Timestamp(date: date) 
        repres["status"] = status
        
        return repres
    }
    
}
