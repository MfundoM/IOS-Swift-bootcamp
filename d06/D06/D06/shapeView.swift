//
//  shapeView.swift
//  D06
//
//  Created by Mfundo MTHETHWA on 2018/10/09.
//  Copyright © 2018 Mfundo MTHETHWA. All rights reserved.
//

import UIKit

enum Shape : UInt {
    case square = 0
    case circle
}

class shapeView: UIView {
    
    let collision : UICollisionBehavior = {
        let collision = UICollisionBehavior()
        collision.translatesReferenceBoundsIntoBoundary = true
        return collision
    }()
    
    let elasticity : UIDynamicItemBehavior = {
        let behavior = UIDynamicItemBehavior()
        behavior.allowsRotation = true
        behavior.elasticity = 0.75
        return behavior
    }()
    
    let shapeSize = 100
    let gravity = UIGravityBehavior()
    
    lazy var animation : UIDynamicAnimator = UIDynamicAnimator(referenceView: self)
    var setAnimation : Bool = false{
        didSet{
            if setAnimation{
                animation.addBehavior(gravity)
                animation.addBehavior(collision)
                animation.addBehavior(elasticity)
            }
            else{
                animation.removeBehavior(gravity)
                animation.removeBehavior(collision)
                animation.removeBehavior(elasticity)
            }
        }
    }
    
    func randomShape() -> CGFloat{
        switch arc4random() % 2 {
        case 0:
            return 0
        default:
            return CGFloat(shapeSize / 2)
        }
    }
    
    override var collisionBoundsType: UIDynamicItemCollisionBoundsType{
        return .ellipse
    }
    
    func randomColor() -> UIColor
    {
        switch arc4random() % 8 {
        case 0:
            return UIColor.green
        case 1:
            return UIColor.red
        case 2:
            return UIColor.blue
        case 3:
            return UIColor.purple
        case 4:
            return UIColor.black
        case 5:
            return UIColor.yellow
        case 6:
            return UIColor.brown
        default:
            return UIColor.cyan
        }
    }
    
    func addShape(point:CGPoint)
    {
        print("shape added")
        let myView = UIView(frame: CGRect(origin:CGPoint(x: point.x - CGFloat(shapeSize / 2), y: point.y - CGFloat(shapeSize/2)), size: CGSize(width: shapeSize, height: shapeSize)))
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.panHandler(_:)))
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(self.pinchHandler(_:)))
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(self.rotationHandler(_:)))
        myView.backgroundColor = randomColor()
        myView.layer.cornerRadius = randomShape()
        myView.clipsToBounds = true
        addSubview(myView)
        gravity.addItem(myView)
        collision.addItem(myView)
        elasticity.addItem(myView)
        myView.isUserInteractionEnabled = true
        myView.addGestureRecognizer(panGesture)
        myView.addGestureRecognizer(pinchGesture)
        myView.addGestureRecognizer(rotateGesture)
    }
    
    @objc func panHandler(_ sender:UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            print("Begin pan")
            self.gravity.removeItem(sender.view!)
        case .changed:
            sender.view?.center = sender.location(in: sender.view?.superview)
            animation.updateItem(usingCurrentState: sender.view!)
        case .ended:
            print("End pan")
            self.gravity.addItem(sender.view!)
        case .failed, .cancelled:
            print("Fail or Cancel pan")
        case .possible:
            print("Possible")
        }
        
    }
    
    @objc func rotationHandler(_ sender: UIRotationGestureRecognizer) {
        if let view = sender.view {
            print(sender.rotation)
            switch sender.state {
            case .began:
                print("Begin rotation")
                self.gravity.removeItem(view)
            case.changed:
                print("Change rotation")
                view.transform = view.transform.rotated(by: sender.rotation)
                animation.updateItem(usingCurrentState: sender.view!)
                sender.rotation = 0
            case .ended:
                print("End rotation")
                self.gravity.addItem(view)
            case .failed, .cancelled:
                print("Failed or Cancelled rotation")
            case .possible:
                print("Possible")
            }
        }
    }
    
    @objc func pinchHandler(_ sender: UIPinchGestureRecognizer) {
        if let view = sender.view {
            print(sender.scale)
            switch sender.state {
            case .began:
                print("Begin pinch")
                self.gravity.removeItem(view)
                self.collision.removeItem(view)
                self.elasticity.removeItem(view)
            case.changed:
                print("Change pinch")
                //For Square
                sender.view?.layer.bounds.size.height *= sender.scale
                sender.view?.layer.bounds.size.width *= sender.scale
                //For Circle
                if (sender.view!.layer.cornerRadius != 0) {
                    sender.view!.layer.cornerRadius *= sender.scale
                }
                sender.scale = 1
            case .ended:
                print("End pinch")
                self.gravity.addItem(view)
                self.collision.addItem(view)
                self.elasticity.addItem(view)
            case .failed, .cancelled:
                print("Failed or Cancelled pinch")
            case .possible:
                print("Possible")
            }
        }

    }
}
