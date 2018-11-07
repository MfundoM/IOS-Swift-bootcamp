//
//  APITwitterDelegate.swift
//  Tweets
//
//  Created by Mfundo MTHETHWA on 2018/10/06.
//  Copyright © 2018 Mfundo MTHETHWA. All rights reserved.
//

import Foundation

protocol APITwitterDelegate: class {
    
    func processRecievedTweets(tweets: [Tweet])
    func handleError(error: NSError)
}
