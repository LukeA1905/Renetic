//
//  ChatMessage.swift
//  ReneticFinal
//
//  Created by Luke Austin on 14/04/2023.
//

import Foundation
import Firebase

struct ChatMessage {
    let sender: String
    let message: String
    let timestamp: Timestamp
    
    init(sender: String, message: String, timestamp: Timestamp = Timestamp()) {
        self.sender = sender
        self.message = message
        self.timestamp = timestamp
    }
    
    init?(dictionary: [String: Any]) {
        guard let sender = dictionary["sender"] as? String,
              let message = dictionary["message"] as? String,
              let timestamp = dictionary["timestamp"] as? Timestamp else {
            return nil
        }
        self.sender = sender
        self.message = message
        self.timestamp = timestamp
    }
    
    var dictionary: [String: Any] {
        return [
            "sender": sender,
            "message": message,
            "timestamp": timestamp
        ]
    }
}
