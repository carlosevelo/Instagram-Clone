//
//  User.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation

struct User: Codable {
    
    //MARK: - Properties
    
    var userId: String
    var email: String
    var username: String
    var fullName: String
    var profileImageUrl: String
    var bio: String
    
    
    //MARK: - Coding Keys
    
    enum CodingKeys: String, CodingKey {
            case userId
            case email
            case username
            case fullName
            case profileImageUrl
            case bio
        }
    
    //MARK: - Initialization
    
    init(userId: String, email: String, profileImageUrl: String, username: String, fullName: String, bio: String) {
        self.userId = userId
        self.email = email
        self.profileImageUrl = profileImageUrl
        self.username = username
        self.fullName = fullName
        self.bio = bio
    }
}
