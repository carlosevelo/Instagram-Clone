//
//  CommentService.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/28/23.
//

import Foundation

class CommentService: ICommentService {
    
    func CreateComment(postId: Int, userId: String, text: Date) {
        <#code#>
    }
    
    func GetCommentByCommentId(commentId: Int) -> Comment {
        return DummyData.dummyComment
    }
    
    func GetCommentListByPostId(postId: Int) -> [Comment] {
        return [DummyData.dummyComment]
    }
    
    func UpdateComment(commentId: Int, postId: Int, userId: Int, text: String) {
        <#code#>
    }
    
    func DeleteComment(commentId: Int) {
        <#code#>
    }
    
    
}
