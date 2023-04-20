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
    static public let dummyPost = Post(userId: "1", caption: "My first caption.", date: Date(), url: URL(string: "https://firebasestorage.googleapis.com/v0/b/instagram-clone-93149.appspot.com/o/posts%2FDa0fxnRxHffxGtnSH05EtJl95lZ2%2F89BB5362-D345-49D1-9BA9-6AEBCBC9AEA6.jpeg?alt=media&token=78c4885b-a9bb-4fb7-9931-f972bd19008c"))
    static public let dummyUser = User(userId: "1", email: "", profileImageUrl: "", username: "dummyUser", fullName: "Dummy", bio: "I am a dummy user.")
    
    static public func GetFeed() -> [Post] {
        var list = [Post]()
        for i in 1...5 {
            var newPost = Post(userId: "\(i)", caption: "My first caption.", date: Date(), url: URL(string: "https://firebasestorage.googleapis.com/v0/b/instagram-clone-93149.appspot.com/o/posts%2FDa0fxnRxHffxGtnSH05EtJl95lZ2%2F89BB5362-D345-49D1-9BA9-6AEBCBC9AEA6.jpeg?alt=media&token=78c4885b-a9bb-4fb7-9931-f972bd19008c"))
            newPost.user = dummyUser
            list.append(newPost)
        }
        
        return list
    }
    
}
