//
//  Topic.swift
//  Forum
//
//  Created by Zenande GODONGWANA on 2018/10/06.
//  Copyright © 2018 Zenande GODONGWANA. All rights reserved.
//


import UIKit

struct Topic: CustomStringConvertible {
    let id: Int
    let name: String
    let author: [String: AnyObject]
    let created_at: String
    
    var description: String {
        return "\(name)\n"
    }
}

struct Message: CustomStringConvertible {
    let id: Int
    let name: String
    let author: [String: AnyObject]
    let kind: String
    let created_at: String
    let updated_at: String
    let messages_url: String
    let message: [String:AnyObject]
    let tags: [AnyObject]
    
    var description: String {
        return "\(name)\n"
    }
}