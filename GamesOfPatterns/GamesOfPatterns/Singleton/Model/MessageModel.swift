//
//  MessageModel.swift
//  GamesOfPatterns
//
//  Created by Sergey on 29.09.2023.
//

import Foundation

struct Message {
    let text: String
    let password: String
}

final class MessageModel {
    private var messages: [String: Message] = [:]
    
    func saveMessage(_ message: Message) {
        messages[message.password] = message
    }
    
    func readMessage(password: String) -> Message? {
        return messages[password]
    }
}
