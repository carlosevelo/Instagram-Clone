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

struct Message: TableRecord, FetchableRecord {
    
    //MARK: - Constants
    
    struct Table {
        static let databaseTableName = "chat"
        
        static let messageID = "MessageID"
        static let chatId = "ChatId"
        static let userId = "UserId"
        static let text = "Text"
    }
    
    //MARK: - Properties
    
    var messageID: Int
    var chatId: Int
    var userId: Int
    var text: String
    
    //MARK: - Initialization

    init(row: GRDB.Row) {
        messageID = row[Table.messageID]
        chatId = row[Table.chatId]
        userId = row[Table.userId]
        text = row[Table.text]
    }
    

}
