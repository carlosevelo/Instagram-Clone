//
//  User.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation

struct User {
    
    //MARK: - Properties
    
    var userId: Int?
    var username: String
    var name: String
    //var profilePicture:
    var bio: String
    
    //MARK: - Initialization
    
    init(username: String, name: String, bio: String) {
        self.username = username
        self.name = name
        self.bio = bio
    }
}
