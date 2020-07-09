//
//  SignProvider.swift
//  Chat_Practice
//
//  Created by Doyoung Song on 7/8/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import Foundation
import Firebase

class SignProvider {
    
    // MARK: - Properties
    private let firestore = Firestore.firestore()
    private let auth = Auth.auth()
    
    func signIn(email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        auth.signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                guard let user = result?.user else { return }
                self.firestore
                    .collection("User")
                    .document(user.uid)
                    .getDocument { (snapshot, error) in
                        if let error = error {
                            completion(.failure(error))
                        } else {
                            guard
                                let data = snapshot?.data(),
                                let nickName = data[UserReference.nickName] as? String
                                else { return }
                            UserDefaults.standard.set(email, forKey: UserReference.email)
                            UserDefaults.standard.set(nickName, forKey: UserReference.nickName)
                            
                            completion(.success("Success"))
                        }
                }
            }
        }
    }
    
    func signUp(email: String, password: String, nickName: String, completion: @escaping (Result<String, Error>) -> () ) {
        auth.createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                guard let user = result?.user else { return }
                
                self.firestore
                    .collection("User")
                    .document(user.uid)
                    .setData([
                        UserReference.email: email,
                        UserReference.nickName: nickName
                    ]) { (error) in
                        
                        if let error = error {
                            completion(.failure(error))
                        } else {
                            completion(.success("Success"))
                        }
                }
            }
        }
    }
    
    func signOut() throws {
        try auth.signOut()
    }
}
