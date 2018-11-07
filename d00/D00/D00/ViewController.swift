//
//  ViewController.swift
//  D00
//
//  Created by Mfundo MTHETHWA on 2018/10/02.
//  Copyright © 2018 Mfundo MTHETHWA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var displayNumber:Double = 0
    var prevNumber:Double = 0
    var res:Double = 0
    var operation = 0
    var performMath = false
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func display(_ sender: UIButton)
    {
        if performMath == true
        {
            label.text = String(sender.tag)
            displayNumber = Double(label.text!)!
            performMath = false
        }
        else
        {
            label.text = label.text! + String(sender.tag)
            displayNumber = Double(label.text!)!
        }
        print(sender.tag)
    }
    
    @IBAction func operators(_ sender: UIButton)
    {
        if sender.tag == 12 // Negative
        {
            displayNumber = displayNumber * -1
            print("Neg")
        }
        else if label.text != "" && sender.tag != 11 && sender.tag != 17
        {
            prevNumber = displayNumber
            if sender.tag == 13 // Divide
            {
                label.text = "/"
                if res > 0
                {
                    res = res / prevNumber
                    label.text = String(res)
                }
                else
                {
                    label.text = String(prevNumber)
                    res = prevNumber
                }
                print("/")
            }
            else if sender.tag == 14 // Multiply
            {
                label.text = "X"
                if res > 0
                {
                    res = res * prevNumber
                    label.text = String(res)
                }
                else
                {
                    label.text = String(prevNumber)
                    res = prevNumber
                }
                print("X")
            }
            else if sender.tag == 15 // Subtract
            {
                label.text = "-"
                if res > 0
                {
                    res = res - prevNumber
                    label.text = String(res)
                }
                else
                {
                    label.text = String(prevNumber)
                    res = prevNumber
                }
                print("-")
            }
            else if sender.tag == 16 // Add
            {
                label.text = "+"
                res = res + prevNumber
                label.text = String(res)
                print("+")
            }
            operation = sender.tag
            performMath = true
            
        }
        else if sender.tag == 17
        {
            if operation == 13
            {
                if prevNumber == 0
                {
                    label.text = String(0)
                }
                else if displayNumber == 0
                {
                    label.text = "Infinity"
                }
                else
                {
                    label.text = String(res / displayNumber)
                }
            }
            else if operation == 14
            {
                label.text = String(res * displayNumber)
            }
            else if operation == 15
            {
                label.text = String(res - displayNumber)
            }
            else if operation == 16
            {
                label.text = String(res + displayNumber)
            }
        }
        else if sender.tag == 11
        {
            label.text = ""
            prevNumber = 0
            displayNumber = 0
            operation = 0
            res = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

