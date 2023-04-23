//
//  PostViewModel.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 4/17/23.
//

import Foundation

class PostViewModel : ObservableObject {
    
    var postService = PostService()
    
    func LikePost(_ post: Post) {
        postService.UpdatePost(postId: post.postId, likes: post.likes, comments: post.comments)
    }
}
