//
//  ChatProvider.swift
//  Chat
//
//  Created by Lee on 2020/07/08.
//  Copyright © 2020 Kira. All rights reserved.
//

import Foundation
import Firebase

class ChatProvider {
  
  private let firestore = Firestore.firestore()
  
  var messages = [MessageModel]()
  
  
  func addListener(completion: @escaping (Result<String, Error>) -> Void) {
    firestore
      .collection("Chat")
      .addSnapshotListener { (snapshot, error) in
        
        if let error = error {
          completion(.failure(error))
          
        } else {
          guard let documents = snapshot?.documents else { return }
          
          var tempMessages = [MessageModel]()
          
          for document in documents {
            let data = document.data()
            guard
              let nickName = data[MessageReference.nickName] as? String,
              let content = data[MessageReference.content] as? String,
              let timestamp = data[MessageReference.date] as? Timestamp
              else { return }
            
            let tempMessage = MessageModel(
              nickName: nickName,
              content: content,
              date: timestamp.dateValue()
            )
            
            tempMessages.append(tempMessage)
          }
          
          tempMessages.sort { $0.date < $1.date }
          self.messages = tempMessages
          
          completion(.success("Success"))
        }
    }
  }
  
  
  func addMessage(content: String) {
    guard let nickName = UserDefaults.standard.string(forKey: UserRefereence.nickName) else { return }
    
    firestore
      .collection("Chat")
      .addDocument(data: [
        MessageReference.nickName: nickName,
        MessageReference.content: content,
        MessageReference.date: Timestamp()
      ])
  }
}
