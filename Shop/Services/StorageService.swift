
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
        //let metadata = StorageMetadata(dictionary:  ["content-type": "image/jpeg"])
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
//    func uploadProductImage(_ image: UIImage, completion: @escaping (Result<URL, Error>) -> Void) {
//        let imageRef = productRef.child("\(UUID().uuidString).jpg")
//        imageRef.putData(image.resizableImage(withCapInsets: .zero).imageRendererFormat.preferredRange.rawValue) { result in
//            switch result {
//                    
//            }
//        }
//    }
}
