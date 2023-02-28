//
//  Post.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation

class Post: Codable {
    var postId: Int
    var userId: Int
    //var media:
    var caption: String
    var date: Date
}
