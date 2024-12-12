//
//  AuthService.swift
//  Shop
//
//  Created by Oleg on 12.12.2024.
//

import Foundation
import FirebaseAuth


class AuthService {
    
    static let shared = AuthService()
    
    private init() {}
    
    private let auth = Auth.auth()
    
    private var currentUser: User? {
        auth.currentUser
    }
    
    func signIn(with email: String,
                password: String, completion: @escaping (Result<User, Error>) -> ()) {
        
        auth.createUser(withEmail: email, password: password) {result, error in
            if let result = result {
                completion(.success(result.user))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
}
