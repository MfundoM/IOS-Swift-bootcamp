//
//  StringExtension.swift
//  rush01
//
//  Created by Mfundo MTHETHWA on 2018/10/12.
//  Copyright © 2018 Mfundo MTHETHWA. All rights reserved.
//

import Foundation

extension String {
    
    static public func localized(_ string: String, comment: String = "") -> String {
        return NSLocalizedString(string, comment: comment)
    }
    
}
