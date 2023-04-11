//
//  DummyData.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/28/23.
//

import Foundation

struct DummyData {
    static public let dummyComment = Comment(postId: 1, userId: 1, text: "My first comment.")
    static public let dummyChat = Chat(userId: 1, recipientId: 2, messages: nil)
    static public let dummyStory = Story(userId: 1, date: Date())
    static public let dummyPost = Post(userId: 1, caption: "My first caption.", date: Date(), media: "post")
    static public let dummyUser = User(uid: 1, email: "", profileImageUrl: "", username: "dummyUser", fullName: "Dummy", bio: "I am a dummy user.")
    
    static public func GetFeed() -> [Post] {
        var list = [Post]()
        for i in 1...5 {
            var newPost = Post(userId: i, caption: "My first caption.", date: Date(), media: "post")
            newPost.user = dummyUser
            list.append(newPost)
        }
        
        return list
    }
    
}
