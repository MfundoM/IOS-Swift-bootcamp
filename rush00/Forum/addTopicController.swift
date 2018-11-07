//
//  addTopicController.swift
//  Forum
//
//  Created by Zenande GODONGWANA on 2018/10/06.
//  Copyright © 2018 Zenande GODONGWANA. All rights reserved.
//


import UIKit

class addTopicController: UIViewController {

    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var contentLabel: UITextView!
    
    var api: APIController?
    var delegate: API42Delegate?
    var tokenObj: Token?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.api = APIController(delegate: self.delegate, token: self.tokenObj!)
    }

    
    @IBAction func saveFunc(_ sender: AnyObject) {
        if !(titleLabel.text?.isEmpty)! {
            if !contentLabel.text.isEmpty {
                api?.postAPI(titleLabel.text!, topicContent: contentLabel.text)
                performSegue(withIdentifier: "unwindForum", sender: "Foo")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    }
}
