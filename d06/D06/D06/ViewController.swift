//
//  ViewController.swift
//  D06
//
//  Created by Mfundo MTHETHWA on 2018/10/09.
//  Copyright © 2018 Mfundo MTHETHWA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var shapeView: shapeView!
    
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        print("Tapped bam bam bam")
        let point = sender.location(in: shapeView)
        shapeView.addShape(point: point)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        shapeView.setAnimation = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        shapeView.setAnimation = false
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

/*
 print("Tapped bam")
 let point = sender.location(in: shapeView)
 shapeView.addShape(point: point)
 */
