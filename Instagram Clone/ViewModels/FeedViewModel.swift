//
//  FeedViewModel.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation
import FirebaseAuth

class FeedViewModel: ObservableObject {
    
    var postService = PostService()
    
    @Published var feed: [Post] = []
    
    init() {
        if let userId = Auth.auth().currentUser?.uid {
            postService.GetFeedByUserId(userId: userId) { posts in
                print("FeedVM: Received: \(posts.count)")
                print(posts.first?.user ?? "Nothing")
                self.feed = posts
            }
        }
    }
}
