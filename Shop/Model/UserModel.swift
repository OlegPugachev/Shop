//
//  UserModel.swift
//  Shop
//
//  Created by Oleg on 15.12.2024.
//

import Foundation
struct UserModel: Identifiable {
    var id: String
    var name: String
    var phone: Int
    var address: String
    
    var representation: [String: Any] {
        
        var repres = [String: Any]()
        
        repres["id"] = self.id
        repres["name"] = self.name
        repres["phone"] = self.phone
        repres["address"] = self.address
        
        return repres
    }
}
