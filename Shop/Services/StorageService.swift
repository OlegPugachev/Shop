
import Foundation
import FirebaseStorage

class StorageService {
    
    static let shared = StorageService()
    private init() { }
    
    private let storage = Storage.storage().reference()
    
    private var productRef: StorageReference {
        storage.child("products")
    }
    
    func upload(id: String, image: Data, completion: @escaping (Result<String, Error>) -> Void) {
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        productRef.child(id).putData(image, metadata: metadata) { metadata, error in
            guard let metadata = metadata else {
                if let error {
                    completion(.failure(error))
                }
                return
            }
            completion(.success("resulting image size \(metadata.size)"))
        }
    }
    
    func downloadProductImage(id: String, completion: @escaping (Result<Data, Error>) -> Void) {
        
        let maxSize2MB: Int64 = 2 * 1024 * 1024
        
        productRef.child(id).getData(maxSize: maxSize2MB) { data, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
            completion(.success(data))
        }
    }
}
