
import Foundation
import FirebaseFirestore

class DataBaseService {
    
    static let shared = DataBaseService()
    private let db = Firestore.firestore()
    
    private var usersRef: CollectionReference {
        db.collection("users")
    }
    
    private var ordersRef: CollectionReference {
        return db.collection("orders")
    }
    
    private init() {}
    
    func setProfile(user: UserModel, completion: @escaping (Result<UserModel, Error>) -> () ) {
        usersRef.document(user.id).setData(user.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
    }
    
    func getProfile(completion: @escaping (Result<UserModel, Error>) -> () ) {
        
        guard let currentUser = AuthService.shared.currentUser else { return }
        
        usersRef.document(currentUser.uid).getDocument { docSnapshot, error in
            guard let snapshot = docSnapshot else { return }
            guard let data = snapshot.data() else { return }
            guard let userName = data["name"] as? String else { return }
            guard let id = data["id"] as? String else { return }
            guard let phone = data["phone"] as? Int else { return }
            guard let address = data["address"] as? String else { return }
            
            let user = UserModel(id: id, name: userName, phone: phone, address: address)
            completion(.success(user))
        }
    }
    
    func setOrder(order: Order, completion: @escaping (Result<Order, Error>) -> () ) {
        ordersRef.document(order.id).setData(order.representation) { error in
            if let error = error {
                dump("setOrder error:" + error.localizedDescription)
                completion(.failure(error))
            } else {
                self.setPositions(to: order.id, positions: order.positions) { result in
                    switch result {
                        case .success(let positions):
                            dump("setPositions success: \(positions.count)")
                            completion(.success(order))
                            dump("setOrder success")
                        case .failure(let error):
                            dump("setPositions error:" + error.localizedDescription)
                    }
                }
            }
        }
    }
    
    func getOrders(by userId: String?, completion: @escaping(Result<[Order], Error>) ->()) {
        self.ordersRef.getDocuments { qSnap, error in
       
            if let qSnap = qSnap {
                var orders: [Order] = [Order]()
                
                for doc in qSnap.documents{
                    if let userId = userId {
                        if let order = Order(doc: doc), order.userId == userId {
                            orders.append(order)
                        }
                    } else { // TODO: for admin
                        if let order = Order(doc: doc) {
                            orders.append(order)
                        }
                    }
                }
                completion(.success(orders))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func setPositions(to orderId: String,
                     positions: [Position],
                     completion: @escaping (Result<[Position], Error>) -> ()) {
        
        let positionRef = ordersRef.document(orderId).collection("positions")
        
        for position in positions {
            positionRef.document(position.id).setData(position.representation)
        }
        completion(.success(positions))
    }
}

