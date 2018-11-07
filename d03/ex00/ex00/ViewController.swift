//
//  ViewController.swift
//  ex00
//
//  Created by Mfundo MTHETHWA on 2018/10/05.
//  Copyright © 2018 Mfundo MTHETHWA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    var imageArry : [UIImage] = []
    
    var imageArray: [String] = [
        "https://apod.nasa.go/apod/image/1808/m2018_08_06Adp.jpg",
        "https://apod.nasa.gov/apod/image/1809/MilkyWayTongue_Merzlyakov_1790.jpg",
        "https://apod.nasa.gov/apod/image/1810/Venus_Radu-Mihai_MG_3429.jpg",
        "https://apod.nasa.gov/apod/image/1810/NGC1898_Hubble_2913.jpg"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Get screen width
        let itemSize = UIScreen.main.bounds.width/2 - 2
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(20, 0, 10, 0)
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        
        collectionView.collectionViewLayout = layout
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Number of views in the collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Touched image#: \(indexPath.row)")
        let myImageViewPage:myImageViewController = self.storyboard?.instantiateViewController(withIdentifier: "scrollView") as! myImageViewController
        myImageViewPage.selectedImage = self.imageArray[indexPath.row]
        self.navigationController?.pushViewController(myImageViewPage, animated: true)
    }
    
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        print("Touched image#: \(indexPath.row)")
//    }
    
    // Populate images in views
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! imageCollectionViewCell
        cell.spinner.isHidden = false
        cell.spinner.startAnimating()
        let url = URL(string: imageArray[indexPath.item])!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.Alert("the link to download one of the or more images")
                    return
                }
                DispatchQueue.main.async {
                    cell.myImage.image = UIImage(data: data!)
                    cell.spinner.stopAnimating()
                    cell.spinner.isHidden = true
                    self.imageArry.append(UIImage(data: data!)!)
                }
            }.resume()
        return cell
    }
    
    func Alert(_ message: String) {
        let msg = "Cannot Access to " + message
        let alert = UIAlertController(title: "Error", message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
        self.present(alert,animated: true, completion: nil)
    }
}

