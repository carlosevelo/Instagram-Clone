//
//  PostService.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 4/22/23.
//

import Foundation
import Firebase
import FirebaseStorage
import FirebaseFirestoreSwift

class PostService {
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
                let newPost = Post(user: self.userService.GetCurrentUser() ?? DummyData.dummyUser, caption: caption, date: Date(), url: downloadURL)
                
                //Store object in Firebase
                do {
                    try self.db.collection("post").document("\(newPost.postId)").setData(from: newPost)
                } catch let error {
                    print("Error writing Post to Firestore: \(error)")
                }
            }
        }
    }
    func GetPostByPostId(postId: Int) -> Post {
        return DummyData.dummyPost
    }
    
    func SetPostListener(userId: String, onComplete: @escaping ([Post]) -> Void) {
        var postList: [Post] = []
        db.collection("post").whereField("userId", isEqualTo: userId).addSnapshotListener() { snapshot, error in
            guard let documents = snapshot?.documentChanges else {
                print("Error fetching documents: \(error!)")
                return
            }
            print("Received \(documents.count) document changes")
            for document in documents {
                if document.type != .modified {
                    var post: Post
                    do {
                        post = try document.document.data(as: Post.self)
                    } catch {
                        print("Error")
                        continue
                    }
                    postList.append(post)
                }
            }
            postList.sort { post1, post2 in
                post1.date > post2.date
            }
            onComplete(postList)
        }
    }
    
    func GetPostListByUserId(userId: String, onComplete: @escaping ([Post]) -> Void) {
        var postList: [Post] = []
        db.collection("post").whereField("userId", isEqualTo: userId).getDocuments() { snapshot, error in
            guard let documents = snapshot?.documents else {
                print("Error fetching documents: \(error!)")
                return
            }
            for document in documents {
                var post: Post
                do {
                    post = try document.data(as: Post.self)
                } catch {
                    print("Error")
                    continue
                }
                postList.append(post)
            }
            postList.sort { post1, post2 in
                post1.date > post2.date
            }
            onComplete(postList)
        }
    }
    
    func SetFeedListener(userId: String, onComplete: @escaping ([Post]) -> Void) {
        return SetPostListener(userId: userId, onComplete: onComplete)
    }
    
    func GetFeedByUserId(userId: String, onComplete: @escaping ([Post]) -> Void) {
        return GetPostListByUserId(userId: userId, onComplete: onComplete)
    }
    
    func UpdatePost(postId: UUID, likes: Int, comments: [Comment]) {
        db.collection("post").document("\(postId)")
            .updateData([
                "likes": likes,
                "comments": comments
            ]) { error in
                if let error = error {
                        print("Error updating document: \(error)")
                    } else {
                        print("Document successfully updated")
                    }
            }
    }
    
    func DeletePost(postId: Int) {
        
    }
}
