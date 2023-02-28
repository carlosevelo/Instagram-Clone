//
//  Chat.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation

class Chat: Codable {
    var chatId: Int
    var userId: Int
    var recipientId: Int
    var messages: [Message]
}

class Message: Codable {
    var messageID: Int
    var chatId: Int
    var userId: Int
    var text: String
}
