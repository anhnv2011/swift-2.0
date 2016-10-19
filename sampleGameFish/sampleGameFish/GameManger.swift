//
//  GameManger.swift
//  sampleGameFish
//
//  Created by anh  nguyen viet on 7/29/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class GameManager : NSObject
{
    var fishViews : NSMutableArray? // co nhieu ca, nen luu vao mang
    var hookView : HookerView?
    
    
    override init() {
        self.fishViews = NSMutableArray()
        self.hookView = HookerView(frame: CGRectMake(0, -490, 20, 490))
        
    }
    
    func addFishToviewController (viewController:UIViewController, width : Int)
    {
        let fishView = FishView(frame: CGRectMake(0, 0, 40, 30))
        fishView.genarateFish(width)
        self.fishViews?.addObject(fishView)
        viewController.view.addSubview(fishView)
        
    }
    
    
    var bitecount = 0
    func bite(fishView:FishView)
    
    {
        if (fishView.status != fishView.CAUGHT && self.hookView?.status != self.hookView?.DRAWING && bitecount == 0)
        {
            fishView.caught()
            fishView.center = CGPointMake(self.hookView!.center.x, self.hookView!.frame.origin.y + self.hookView!.frame.height + fishView.frame.width/2)
            self.hookView?.status = self.hookView?.CAUGHTF
            bitecount = 1
        }
        if (self.hookView?.status == self.hookView?.PREPARE )
            
        {
            bitecount = 0
        }
        
    }
    
    
    func updateMove()
    {
        self.hookView?.updateMove()
        for fishView in self.fishViews!
        {
            fishView.updateMove()
            
            
            if (CGRectContainsPoint(fishView.frame, CGPointMake(self.hookView!.center.x, self.hookView!.frame.origin.y + self.hookView!.frame.height + fishView.frame.width/2)))
            {
                bite (fishView as! FishView)
            }
        }
    }
    
    func dropHookerAtX(x: Int)
    {
        self.hookView?.dropDownAtX(x)
    }



}
