//
//  User.swift
//  Tarrare
//
//  Created by Rashad Philizaire on 7/6/22.
//

import Foundation
import FirebaseAuth
import Alamofire

class User: Codable {
    let id : Int
    let firstName : String
    let lastName: String
    let email: String
    let delivering: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName
        case lastName
        case email
        case delivering
    }
    
    static func setCurrent(_ user: User, writeToUserDefaults: Bool = false) {
        if writeToUserDefaults {
            if let data = try? JSONEncoder().encode(user) {
                UserDefaults.standard.set(data, forKey: Constants.UserDefaults.currentUser)
                
            }
        }
    }
    
    static func getCurrent() -> User? {
        let userData = UserDefaults.standard.object(forKey: Constants.UserDefaults.currentUser) as? Data
        guard let userData = userData else {
            return nil
        }
        let user = try? JSONDecoder().decode(User.self, from:userData)
        return user
    }
    
}

extension User: Equatable {
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
}

