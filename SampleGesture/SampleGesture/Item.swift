//
//  Item.swift
//  SampleGesture
//
//  Created by anh  nguyen viet on 7/29/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit
class Item : UIImageView, UIGestureRecognizerDelegate
{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    
    func setup()
    {
        self.userInteractionEnabled = true // cac tuong tac da cham moi thuc hien duoc
        self.multipleTouchEnabled = true
        let panGesture = UIPanGestureRecognizer (target: self, action: Selector("onPan:"))
        self.addGestureRecognizer(panGesture)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: Selector("pinchPhoto:"))
        self.addGestureRecognizer(pinchGesture)
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: Selector("rotateItem:"))
        rotateGesture.delegate = self
        self.addGestureRecognizer(rotateGesture)
        
    }
    
    func gestureRecogizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func onPan(panGesture : UIPanGestureRecognizer)
    {
        if (panGesture.state == .Began || panGesture.state == .Changed)
        {
            let point = panGesture.locationInView(self.superview) // lay toa do so voi view cha
            self.center = point
        }
    
    }
    
    func pinchPhoto(pinchGestureRecognizer: UIPinchGestureRecognizer )
    {
        if let view = pinchGestureRecognizer.view
        {
            view.transform = CGAffineTransformScale(view.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale)
            pinchGestureRecognizer.scale = 1
        }
    
    }
    
    
    func rotateItem (rotateGestureRecognizer: UIRotationGestureRecognizer)
    {
        if let view = rotateGestureRecognizer.view
        {
            view.transform = CGAffineTransformRotate(view.transform, rotateGestureRecognizer.rotation)
            rotateGestureRecognizer.rotation = 0
        }
    
    }
    
}
