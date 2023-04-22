//
//  ProfileDataModel.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 4/16/23.
//

import Foundation
import Firebase
import FirebaseAuth

class ProfileDataModel : ObservableObject {
    @Published var items: [Item] = []
    @Published var profileImage: Data = Data()
    @Published var name: String = "Carlos"
    @Published var username: String = "Carlos"
    @Published var bio: String = "Carlos bio"
    
    var postService = PostService()
    
    init() {
        if let currentUser = Auth.auth().currentUser {
            //TODO: Get profile data from Firebase
        
            postService.GetPostListByUserId(userId: currentUser.uid) { posts in
                var itemList: [Item] = []
                for post in posts {
                    itemList.append(Item(post: post))
                }
                self.items = itemList
            }
        }
    }
}

