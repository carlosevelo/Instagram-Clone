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
    var user: User?
    var url: String
    var imageData: Data?
    var caption: String
    var date: Date
    
    
    //MARK: - Coding Keys
    enum CodingKeys: String, CodingKey {
            case postId
            case userId
            case url
            case caption
            case date
        }
    
    //MARK: - Initialization
    
    init(userId: String, caption: String, date: Date, url: String) {
        self.postId = UUID()
        self.userId = userId
        self.caption = caption
        self.date = date
        self.url = url
    }
}
