//
//  ViewController.swift
//  RunningBall
//
//  Created by anh  nguyen viet on 7/27/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var ball = UIImageView()
    var radians = CGFloat()
    var ballRadious = CGFloat()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBall()
        let timer = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: "rollBall", userInfo: nil, repeats: true)
        
    }
    
    func addBall()
    {
        let mainViewSize = self.view.bounds.size
        ball = UIImageView(image: UIImage(named: "ball.png"))
        ballRadious = 32.0
        ball.center = CGPointMake(ballRadious, mainViewSize.height/2)
        self.view.addSubview(ball)
        
    
    }
    
    
    func rollBall()
    {
    
        //bien tang goc quay
        let deltaAngle : CGFloat = 0.1
        radians = radians + deltaAngle
        
        self.ball.transform = CGAffineTransformMakeRotation(radians)
                self.ball.center = CGPointMake(ball.center.x + ballRadious*deltaAngle, ball.center.y)
        print("\(ball.center.x)")
        
    }

}

