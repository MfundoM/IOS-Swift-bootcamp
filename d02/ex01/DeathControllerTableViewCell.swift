//
//  DeathControllerTableViewCell.swift
//  ex01
//
//  Created by Mfundo MTHETHWA on 2018/10/04.
//  Copyright © 2018 Mfundo MTHETHWA. All rights reserved.
//

import UIKit

class DeathControllerTableViewCell: UITableViewCell {
 
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var death : (String, String, String)? {
        didSet {
            if let d = death {
                nameLabel?.text = String(d.0)
                dateLabel?.text = String(d.1)
                descriptionLabel?.text = String(d.2)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
