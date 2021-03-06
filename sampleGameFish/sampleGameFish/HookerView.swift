//
//  HookerView.swift
//  sampleGameFish
//
//  Created by anh  nguyen viet on 7/29/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit



class HookerView : UIImageView {
    let PREPARE = 0
    let DROPPING = 1
    let DRAWING = 2
    let CAUGHTF = 3
    var status:Int?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.image = UIImage(named: "hook.png")
        self.status = PREPARE
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateMove()
    
    {
        if (self.status == DROPPING)
        {
            self.center = CGPointMake(self.center.x, self.center.y + 10)
            if (self.frame.origin.y + self.frame.height > 480)
            {
                self.status = DRAWING
            }
        }
        
        else if (self.status == DRAWING)
        {
            self.center = CGPointMake(self.center.x, self.center.y - 20)
            if (self.frame.origin.y + self.frame.height < 0)
            {
                self.status = PREPARE
            }
        
        }
        
        else if (self.status == CAUGHTF)
        {
            self.center = CGPointMake(self.center.x, self.center.y - 5)
            if (self.frame.origin.y + self.frame.height < 0)
            {
                self.status = PREPARE
            }
        
        }
        
    
    }
    
    
    
    
    func dropDownAtX (x : Int)
    {
        self.center = CGPointMake(CGFloat(x), self.center.y)
        self.status = DROPPING
        
    }
    
}
