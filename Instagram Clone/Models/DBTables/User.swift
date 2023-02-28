//
//  User.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation
import GRDB

struct User: TableRecord, FetchableRecord {
    
    //MARK: - Constants
    
    struct Table {
        static let databaseTableName = "chat"
        
        static let userId = "userId"
        static let username = "username"
        static let name = "name"
        static let bio = "bio"
    }
    
    //MARK: - Properties
    
    var userId: Int
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
    
    init(row: Row) {
        userId = row[Table.userId]
        username = row[Table.username]
        name = row[Table.name]
        bio = row[Table.bio]
    }
}
