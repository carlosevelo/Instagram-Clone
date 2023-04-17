//
//  FeedService.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation

class PostService: IPostService {
    
    func CreatePost(userId: Int, caption: String, date: Date) {
        
    }
    func GetPostByPostId(postId: Int) -> Post {
        return DummyData.dummyPost
    }
    
    func GetPostListByUserId(userId: String) -> [Post] {
        return [DummyData.dummyPost]
    }
    
    func GetFeedByUserId(userId: Int) -> [Post] {
        return [DummyData.dummyPost]
    }
    
    func UpdatePost(postId: Int, userId: Int, caption: String, date: Date) {
        
    }
    
    func DeletePost(postId: Int) {
        
    }
    
}
