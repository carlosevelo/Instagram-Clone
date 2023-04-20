//
//  FeedService.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation
import Firebase
import FirebaseStorage
import FirebaseFirestoreSwift

class PostService: IPostService {
    
    var userService = UserService()
    
    let db = Firestore.firestore()
    let storageRef = Storage.storage().reference().child("posts")
    let currentUserId = Auth.auth().currentUser?.uid ?? "0"
    
    func CreatePost(imageData: Data, caption: String) {
        //Upload image data
        let fullRef = storageRef.child("/\(currentUserId)/\(UUID()).jpeg")
        _ = fullRef.putData(imageData, metadata: nil) { (metadata, error) in
            fullRef.downloadURL { (url, error) in
                guard let downloadURL = url else {
                  // Uh-oh, an error occurred!
                  return
                }
                
                //Create new Post object
                let newPost = Post(user: self.userService.GetCurrentUser(), caption: caption, date: Date(), url: downloadURL)
                
                //Store object in Firebase
                do {
                    try self.db.collection("post").document().setData(from: newPost)
                } catch let error {
                    print("Error writing Post to Firestore: \(error)")
                }
            }
        }
    }
    func GetPostByPostId(postId: Int) -> Post {
        return DummyData.dummyPost
    }
    
    func GetPostListByUserId(userId: String, onComplete: @escaping ([Post]) -> Void) {
        var postList: [Post] = []
        db.collection("post").whereField("userId", isEqualTo: userId).getDocuments() { querySnapshot, err in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    var post: Post
                    do {
                        post = try document.data(as: Post.self)
                    } catch {
                        print("Error")
                        continue
                    }
                    postList.append(post)
                }
                print("Received \(postList.count) posts")
                onComplete(postList)
            }
        }
    }
    
    func GetFeedByUserId(userId: String, onComplete: @escaping ([Post]) -> Void) {
        return GetPostListByUserId(userId: userId, onComplete: onComplete)
    }
    
    func UpdatePost(postId: Int, userId: String, caption: String, date: Date) {
        
    }
    
    func DeletePost(postId: Int) {
        
    }
    
}
