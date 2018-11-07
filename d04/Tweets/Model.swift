//
//  Model.swift
//  Tweets
//
//  Created by Mfundo MTHETHWA on 2018/10/06.
//  Copyright © 2018 Mfundo MTHETHWA. All rights reserved.
//

import Foundation

struct Tweet: CustomStringConvertible {
    
    let name: String
    let text: String
    let date: String
    
    var description: String {
        return "\(name): \(text)"
    }
    
}
