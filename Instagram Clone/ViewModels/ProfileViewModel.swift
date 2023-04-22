//
//  ProfileViewModel.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation
import Firebase
import FirebaseAuth

class ProfileViewModel: ObservableObject {
        
    let currentUserID = "IDoi8a1hG9cIdW8OwvZ4V2Xx0JF3"
    var postService = PostService()
    var userService = UserService()
    
    @Published var profileData = ProfileDataModel()
    
    func SaveProfile() {
        //TODO: Save to firebase
    }
    
    func RefreshPosts() {
        postService.GetPostListByUserId(userId: currentUserID) { posts in
            print("Refreshing feed...")
            print("Before: \(self.profileData.items.count)")
            print("After: \(posts.count)")
            var itemList: [Item] = []
            for post in posts {
                itemList.append(Item(post: post))
            }
            self.profileData.items = itemList
        }
    }
    
}
