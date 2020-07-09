//
//  MessageModel.swift
//  Chat_Practice
//
//  Created by Doyoung Song on 7/8/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import Foundation

struct MessageModel {
    let nickName: String
    let content: String
    let date: Date
}

struct MessageReference {
    static let nickName = "NickName"
    static let content = "Content"
    static let date = "Date"
}
