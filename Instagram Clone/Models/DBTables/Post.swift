//
//  Post.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation

struct Post : Codable {
    
    //MARK: - Properties
    
    var postId: UUID
    var userId: String
    var url: URL?
    var caption: String
    var date: Date
    
    //Added properties
    var user: User?
    
    //MARK: - Coding Keys
    enum CodingKeys: String, CodingKey {
            case postId
            case userId
            case user
            case url
            case caption
            case date
        }
    
    //MARK: - Initialization
    
    init(userId: String, caption: String, date: Date, url: URL?) {
        self.postId = UUID()
        self.userId = userId
        self.caption = caption
        self.date = date
        self.url = url
    }
    
    init(user: User?, caption: String, date: Date, url: URL?) {
        self.postId = UUID()
        self.userId = user?.userId ?? "-1"
        self.user = user
        self.caption = caption
        self.date = date
        self.url = url
    }
}
