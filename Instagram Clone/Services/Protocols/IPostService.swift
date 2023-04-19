//
//  IPostService.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation

protocol IPostService {
    //MARK: - Create Methods
    func CreatePost(imageData: Data, caption: String)
    
    //MARK: - Get Methods
    func GetPostByPostId(postId: Int) -> Post
    func GetPostListByUserId(userId: String, onComplete: @escaping ([Post]) -> Void)
    func GetFeedByUserId(userId: String, onComplete: @escaping ([Post]) -> Void)
    
    //MARK: - Update Methods
    func UpdatePost(postId: Int, userId: String, caption: String, date: Date)
    
    //MARK: - Delete Methods
    func DeletePost(postId: Int)
}
