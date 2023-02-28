//
//  Comment.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation

class Comment: Codable {
    var commentId: Int
    var postId: Int
    var userId: Int
    var text: String
}
