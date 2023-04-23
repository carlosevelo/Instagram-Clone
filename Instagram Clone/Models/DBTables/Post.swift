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
    var likes: Int
    var comments: [Comment]
    
    //Added properties
    var user: User
    
    //MARK: - Coding Keys
    enum CodingKeys: String, CodingKey {
            case postId
            case userId
            case user
            case url
            case caption
            case date
            case likes
            case comments
        }
    
    //MARK: - Initialization
    
//    init(userId: String, caption: String, date: Date, url: URL?) {
//        self.postId = UUID()
//        self.userId = userId
//        self.caption = caption
//        self.date = date
//        self.url = url
//        self.likes = 0
//        self.comments = []
//    }
    
    init(user: User, caption: String, date: Date, url: URL?) {
        self.postId = UUID()
        self.userId = user.userId
        self.user = user
        self.caption = caption
        self.date = date
        self.url = url
        self.likes = 0
        self.comments = []
    }

}
