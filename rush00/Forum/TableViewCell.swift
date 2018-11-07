//
//  TableViewCell.swift
//  Forum
//
//  Created by Zenande GODONGWANA on 2018/10/06.
//  Copyright © 2018 Zenande GODONGWANA. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var topicId: Int?
}
