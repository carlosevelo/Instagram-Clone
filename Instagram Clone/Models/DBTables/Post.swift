//
//  Post.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation

struct Post {
    
    //MARK: - Properties
    
    var postId: Int?
    var userId: Int
    var user: User?
    var url: String
    var caption: String
    var date: Date
    
    //MARK: - Initialization
    
    init(userId: Int, caption: String, date: Date, url: String) {
        self.userId = userId
        self.caption = caption
        self.date = date
        self.url = url
    }
}
