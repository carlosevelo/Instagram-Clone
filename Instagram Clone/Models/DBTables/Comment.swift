//
//  Comment.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation

struct Comment {
    
    //MARK: - Properties
    
    var commentId: Int?
    var postId: Int
    var userId: Int
    var text: String
    
    //MARK: - Initialization
    
    init(postId: Int, userId: Int, text: String) {
        self.postId = postId
        self.userId = userId
        self.text = text
    }
}
