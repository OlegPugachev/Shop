
import Foundation
import FirebaseFirestore

class DataBaseService {
    
    static let shared = DataBaseService()
    private let db = Firestore.firestore()
    private var usersRef: CollectionReference { db.collection("users") }
    private var ordersRef: CollectionReference { return db.collection("orders") }
    private var productsRef: CollectionReference { return db.collection("products") }
    
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
    
    func getProfile(by userId: String = "", completion: @escaping (Result<UserModel, Error>) -> () ) {
        
        var id: String
        if userId != "" {
            id = userId
        } else {
            guard AuthService.shared.currentUser != nil else { return }
            guard AuthService.shared.currentUser?.uid != nil else { return }
            id = AuthService.shared.currentUser!.uid
        }
        
        usersRef.document(id).getDocument { docSnapshot, error in
            
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
    
    func getPositions(by orderId: String, completion: @escaping(Result<[Position], Error>) ->()) {
        let positionsRef = ordersRef.document(orderId).collection("positions")
        
        positionsRef.getDocuments { qSnap, error in
            if let qSnap = qSnap {
                var positions = [Position]()
                
                for doc in qSnap.documents {
                    if let position = Position(doc: doc) {
                        positions.append(position)
                    }
                }
                completion(.success(positions))
            } else if let error {
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
    
    func setProduct(product: Product, completion: @escaping (Result<Product, Error>) -> ()) {
        self.productsRef.document(product.id).setData(product.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(product))
            }
        }
    }
    
    func setProductWithImage(product: Product, image: Data, completion: @escaping (Result<Product, Error>) -> ()) {
        StorageService.shared.upload(id: product.id, image: image) { result in
            switch result {
                case .success(_):
                    self.setProduct(product: product) { res in
                        switch res {
                            case .success(let product):
                                dump("setProduct: \(product.title)")
                            case.failure(let error):
                                dump("Error setProduct: \(error.localizedDescription)")
                        }
                    }
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}

