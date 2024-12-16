
import Foundation
import FirebaseFirestore

class DataBaseService {
    
    static let shared = DataBaseService()
    private let db = Firestore.firestore()
    
    private var usersRef: CollectionReference {
        db.collection("users")
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
        usersRef.document(AuthService.shared.currentUser!.uid).getDocument { docSnapshot, error in
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
}
