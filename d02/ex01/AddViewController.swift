//
//  AddViewController.swift
//  ex01
//
//  Created by Mfundo MTHETHWA on 2018/10/04.
//  Copyright © 2018 Mfundo MTHETHWA. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descriptionField: UITextView!
    
    @IBAction func Done(_ sender: Any) {
        if nameField.text != "" {
            let format = DateFormatter()
            format.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let newDate = format.string(from: datePicker.date)
            
            print(nameField.text!)
            print(newDate)
            print(descriptionField.text!)
            
            let details = (nameField.text!, newDate, descriptionField.text!)
            Data.Deaths.append(details)
            self.navigationController?.popViewController(animated: true)
        } else {
            print("Name or description field cannot be empty")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//extension ViewController : UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
//}
