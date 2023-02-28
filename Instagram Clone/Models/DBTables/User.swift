//
//  User.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation

struct User: Codable {
    var userId: Int
    var username: String
    var name: String
    //var profilePicture:
    var bio: String
}
