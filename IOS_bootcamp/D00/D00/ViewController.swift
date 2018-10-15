//
//  ViewController.swift
//  D00
//
//  Created by Mfundo MTHETHWA on 2018/10/05.
//  Copyright © 2018 Mfundo MTHETHWA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var imageArray = [
        URL(string: "https://www.nasa.gov/sites/default/files/thumbnails/image/18-081.png"),
        URL(string: "https://www.nasa.gov/sites/default/files/thumbnails/image/expedition_56_landing_181004.jpg"),
        URL(string: "https://www.nasa.gov/sites/default/files/thumbnails/image/pia22486-16.jpg"),
        URL(string: "https://www.nasa.gov/sites/default/files/thumbnails/image/30157908867_e926f3f976_k.jpg")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myImageCollectionViewCell
        
        if let data = try? Data(contentsOf: imageArray[indexPath.item]!)
        {
            if let image = UIImage(data: data)
            {
                cell.myImage.image = image
            }
        }
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

