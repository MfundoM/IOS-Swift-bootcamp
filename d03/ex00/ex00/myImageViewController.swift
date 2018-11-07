//
//  myImageViewController.swift
//  ex00
//
//  Created by Mfundo MTHETHWA on 2018/10/05.
//  Copyright © 2018 Mfundo MTHETHWA. All rights reserved.
//

import UIKit

class myImageViewController: UIViewController {

    var imageView : UIImageView?
    var image :UIImage?
    @IBOutlet weak var myImage: UIScrollView!
    var selectedImage:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            let imageUrl = URL(string: self.selectedImage)
            let imageData = NSData(contentsOf: imageUrl!)
            
            if imageData != nil {
                self.imageView?.image = UIImage(data: imageData! as Data)
                
            }
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
