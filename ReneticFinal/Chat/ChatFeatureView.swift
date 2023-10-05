//
//  ChatFeatureView.swift
//  ReneticFinal
//
//  Created by Luke Austin on 14/04/2023.
//

import SwiftUI
import Firebase

struct ChatView: View {
    @State private var messageText = ""
    @State private var messages = [ChatMessage]()
    @Binding var username: String
    
    private let collectionRef = Firestore.firestore().collection("messages")
    
    var body: some View {
        VStack {
            Text("Logged in as: \(username)")
            List(messages) { message in
                Text("\(message.sender): \(message.message)")
            }
            HStack {
                TextField("Enter Message", text: $messageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: sendMessage) {
                    Text("Send")
                }
            }
        }
        .padding()
        .onAppear {
            listenForMessages()
        }
    }
    
    func sendMessage() {
        let newMessage = ChatMessage(sender: username, message: messageText)
        collectionRef.addDocument(data: [
            "sender": newMessage.sender,
            "message": newMessage.message,
            "timestamp": Timestamp()
        ]) { error in
            if let error = error {
                print("Error adding document: \(error.localizedDescription)")
            }
        }
        messageText = ""
    }
    
    func listenForMessages() {
        collectionRef.order(by: "timestamp", descending: false).addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            messages = documents.map { queryDocumentSnapshot -> ChatMessage in
                let data = queryDocumentSnapshot.data()
                let sender = data["sender"] as? String ?? ""
                let message = data["message"] as? String ?? ""
                let timestamp = data["timestamp"] as? Timestamp ?? Timestamp()
                return ChatMessage(sender: sender, message: message, timestamp: timestamp)
            }
        }
    }
}

struct ChatMessage: Identifiable {
    var id = UUID()
    var sender: String
    var message: String
    var timestamp: Timestamp
    
    init(sender: String, message: String, timestamp: Timestamp = Timestamp()) {
        self.sender = sender
        self.message = message
        self.timestamp = timestamp
    }
}

struct LoginView: View {
    @State private var username = ""
    @State private var isLoggedIn = false
    
    var body: some View {
        VStack {
            if isLoggedIn {
                ChatView(username: $username)
            } else {
                TextField("Enter a username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    isLoggedIn = true
                }) {
                    Text("Enter Chat")
                }
            }
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

