//
//  FeedViewModel.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation
import FirebaseAuth

class FeedViewModel: ObservableObject {
    
    let currentUserID = "IDoi8a1hG9cIdW8OwvZ4V2Xx0JF3"
    var postService = PostService()
    
    @Published var feed: [Post] = []
    
    init() {
        SetFeedListener()
    }
    
    func SetFeedListener() {
        postService.SetFeedListener(userId: currentUserID) { posts in
            print("Listening...")
            print("Before: \(self.feed.count)")
            print("After: \(posts.count)")
            self.feed = posts
        }
    }
    
    func RefreshPosts() {
        postService.GetPostListByUserId(userId: currentUserID) { posts in
            print("Refreshing feed...")
            print("Before: \(self.feed.count)")
            print("After: \(posts.count)")
            self.feed = posts
        }
    }
}
