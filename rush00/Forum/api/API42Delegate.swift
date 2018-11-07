//
//  API42Delegate.swift
//  Forum
//
//  Created by Zenande GODONGWANA on 2018/10/06.
//  Copyright © 2018 Zenande GODONGWANA. All rights reserved.
//

import UIKit

protocol API42Delegate: class {
    func handleTopic(_ topics: [Topic])
    func handleError(_ error: NSError)
}
