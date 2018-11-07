//
//  ResponseTableViewCell.swift
//  Forum
//
//  Created by Zenande GODONGWANA on 2018/10/06.
//  Copyright © 2018 Zenande GODONGWANA. All rights reserved.
//

import UIKit

class ResponseTableViewCell: UITableViewCell {

    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var messageId: Int?
}
