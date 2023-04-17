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
    
    var postService = PostService()
    
    init() {
//        if let currentUser = Auth.auth().currentUser {
//            let userPosts = postService.GetPostListByUserId(userId: currentUser.uid)
//            for post in userPosts {
//                addItem(Item(post: post))
//            }
//        }
    }
    
    /// Adds an item to the data collection.
    func addItem(_ item: Item) {
        items.insert(item, at: 0)
    }

}

