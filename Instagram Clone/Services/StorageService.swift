//
//  StorageService.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 4/5/23.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage

class StorageService {
    static var storage = Storage.storage()
    static var rootRef = storage.reference(forURL: "gs://instagram-clone-93149.appspot.com")
    static var profileImagesRef = rootRef.child("profileImage")
    static var userPostsRef = rootRef.child("userPosts")
    
    
    func SaveProfileImage(data: Data, userId: Int) {
        SaveImage(data: data, reference: StorageService.profileImagesRef.child("\(userId)"))
    }
    
    func SavePostImage(data: Data, userId: Int) {
        SaveImage(data: data, reference: StorageService.userPostsRef.child("\(userId)"))
    }
    
    func SaveImage(data: Data, reference: StorageReference) {
        let uploadTask = reference.putData(data, metadata: nil) { (metatdata, error) in
            if error != nil {
                //Error occured
                return
            }
            guard let metatdata = metatdata else {
                return
            }
            if error != nil {
                //Error occured
                return
            }
            reference.downloadURL { (url, error) in
                guard let downloadUrl = url else {
                    return
                }
            }
        }
    }
}
