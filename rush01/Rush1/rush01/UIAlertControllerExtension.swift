//
//  UIAlertControllerExtension.swift
//  rush01
//
//  Created by Mfundo MTHETHWA on 2018/10/12.
//  Copyright © 2018 Mfundo MTHETHWA. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    public static func createAlert(title : String?, message: String, buttons : CVarArg..., completion: ((String) -> Void)?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for elem in buttons {
            if let button = elem as? String {
                alert.addAction(UIAlertAction(title: button, style: (button != String.localized("Cancel")) ? UIAlertActionStyle.default : UIAlertActionStyle.cancel, handler: { (action) in
                    completion?(button)
                }))
            }
        }
        return alert
    }
}
