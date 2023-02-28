//
//  Comment.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation
import GRDB

struct Comment: TableRecord, FetchableRecord {
    
    // MARK: - Constants

    struct Table {
        static let databaseTableName = "comment"

        static let commentId = "CommentId"
        static let postId = "PostId"
        static let userId = "UserId"
        static let text = "Text"
    }
    
    //MARK: - Properties
    
    var commentId: Int
    var postId: Int
    var userId: Int
    var text: String
    
    //MARK: - Initialization
    
    init(postId: Int, userId: Int, text: String) {
        self.postId = postId
        self.userId = userId
        self.text = text
    }
    
    init(row: GRDB.Row) throws {
        commentId = row[Table.commentId]
        postId = row[Table.postId]
        userId = row[Table.userId]
        text = row[Table.text]
    }
    
}
