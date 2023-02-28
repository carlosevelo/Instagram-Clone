//
//  ICommentService.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/28/23.
//

import Foundation

protocol ICommentService {
    //MARK: - Create Methods
    func CreateComment(postId: Int, userId: String, text: Date)
    
    //MARK: - Get Methods
    func GetCommentByCommentId(commentId: Int) -> Comment
    func GetCommentListByPostId(postId: Int) -> [Comment]
    
    //MARK: - Update Methods
    func UpdateComment(commentId: Int, postId: Int, userId: Int, text: String)
    
    //MARK: - Delete Methods
    func DeleteComment(commentId: Int)
}
