//
//  FeedService.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation

class PostService: IPostService {
    
    func CreatePost(userId: Int, caption: String, date: Date) {
        <#code#>
    }
    func GetPostByPostId(postId: Int) -> Post {
        return DummyData.dummyPost
    }
    
    func GetPostListByUserId(userId: Int) -> [Post] {
        return [DummyData.dummyPost]
    }
    
    func GetFeedByUserId(userId: Int) -> [Post] {
        return [DummyData.dummyPost]
    }
    
    func UpdatePost(postId: Int, userId: Int, caption: String, date: Date) {
        <#code#>
    }
    
    func DeletePost(postId: Int) {
        <#code#>
    }
    
}
