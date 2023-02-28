//
//  IPostService.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation

protocol IPostService {
    //MARK: - Create Methods
    func CreatePost(userId: Int, caption: String, date: Date)
    
    //MARK: - Get Methods
    func GetPostByPostId(postId: Int) -> Post
    func GetPostListByUserId(userId: Int) -> [Post]
    func GetFeedByUserId(userId: Int) -> [Post]
    
    //MARK: - Update Methods
    func UpdatePost(postId: Int, userId: Int, caption: String, date: Date)
    
    //MARK: - Delete Methods
    func DeletePost(postId: Int)
}
