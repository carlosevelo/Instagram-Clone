//
//  Chat.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation
import GRDB

struct Chat: TableRecord, FetchableRecord {
    
    //MARK: - Constants
    
    struct Table {
        static let databaseTableName = "chat"
        
        static let chatId = "ChatId"
        static let userId = "UserId"
        static let recipientId = "RecipientId"
        static let messages = "Messages"
    }
    
    //MARK: - Properties
    
    var chatId: Int
    var userId: Int
    var recipientId: Int
    var messages: [Message]
    
    //MARK: - Initialization
    
    init(row: Row) {
        chatId = row[Table.chatId]
        userId = row[Table.userId]
        recipientId = row[Table.recipientId]
        messages = row[Table.messages]
    }
}

struct Message: FetchableRecord {
    init(row: GRDB.Row) {
        <#code#>
    }
    
    var messageID: Int
    var chatId: Int
    var userId: Int
    var text: String
}
