//
//  User.swift
//  FriendsApp
//
//  Created by Sergey Shcheglov on 08.02.2022.
//

import Foundation

struct User: Codable {
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    
    var tags: [String]
    var friends: [Friends]
}


