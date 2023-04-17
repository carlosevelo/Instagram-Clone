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
    @Published var items: [Item] = [Item(post: DummyData.dummyPost), Item(post: DummyData.dummyPost), Item(post: DummyData.dummyPost), Item(post: DummyData.dummyPost), Item(post: DummyData.dummyPost), Item(post: DummyData.dummyPost), Item(post: DummyData.dummyPost), Item(post: DummyData.dummyPost), Item(post: DummyData.dummyPost), Item(post: DummyData.dummyPost), Item(post: DummyData.dummyPost), Item(post: DummyData.dummyPost), Item(post: DummyData.dummyPost)]
    @Published var profileImage: Data = Data()
    @Published var name: String = "Carlos"
    @Published var username: String = "Carlos"
    @Published var bio: String = "Carlos bio"
    
    var postService = PostService()
    
    init() {
        if let currentUser = Auth.auth().currentUser {
            //TODO: Get profile data from Firebase
        
            let userPosts = postService.GetPostListByUserId(userId: currentUser.uid)
            var itemList: [Item] = []
            for post in userPosts {
                itemList.append(Item(post: post))
            }
            items = itemList
        }
    }
}

