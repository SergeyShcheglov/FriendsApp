//
//  User.swift
//  FriendsApp
//
//  Created by Sergey Shcheglov on 08.02.2022.
//

import Foundation

struct User {
    var id: String
    var isActive: Bool
    var name: String
    var age: String
    var company: String
    var email: String
    var address: String
    var about: String
    var registrationDate: Date
    
    var tags: [String]
    var friends = [Friends]()
}
