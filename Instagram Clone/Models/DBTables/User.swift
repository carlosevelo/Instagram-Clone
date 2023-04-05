//
//  User.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation

struct User: Codable {
    
    //MARK: - Properties
    
    var userId: Int
    var email: String
    var profileImageUrl: String
    var username: String
    var fullName: String
    var bio: String
    
    //MARK: - Initialization
    
    init(userId: Int, email: String, profileImageUrl: String, username: String, fullName: String, bio: String) {
        self.userId = userId
        self.email = email
        self.profileImageUrl = profileImageUrl
        self.username = username
        self.fullName = fullName
        self.bio = bio
    }
}
