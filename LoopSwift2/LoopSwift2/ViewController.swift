//
//  ViewController.swift
//  LoopSwift2
//
//  Created by anh  nguyen viet on 7/23/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var n = 5
    var lastonLed = -1
    
    var checkImage = false
    var _margin:CGFloat = 30
    var _margin2:CGFloat = 120
    var timer = NSTimer()
    override func viewDidLoad() {
        super.viewDidLoad()
                drawBall()
        
        timer  = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(runningLed), userInfo: nil, repeats: true)
        
    }
    
    
    func runningLed ()
    {
//        n = Int(textboxDraw.text!)!
    //4
        if (lastonLed != (n - 1))
        {
            turnOffLed()
            
            // TAT HET DEN
            
        }
        
        // -1 -1 -1 -1 -1
        if (lastonLed >= 0)
        {
            lastonLed = lastonLed - 1
            
        }
        else
        {
            lastonLed = n - 1
            // BAT CAI 4, 3 ,2 ,1
        }
        turnOnLed()
//                if (lastonLed != -1)
//                {
//                    turnOffLed()
//        
//                }
//        
//                if (lastonLed <= (n-1))
//                {
//                    lastonLed = lastonLed + 1
//                }
//                else
//                {
//                    lastonLed = 0
//                }
//        
//                turnOnLed()
    }
    
    func turnOnLed ()
    {
        if let ball = self.view.viewWithTag(100 + lastonLed) as? UIImageView
        {
            ball.image = UIImage(named: "green.png")
        }
    }
    
    func turnOffLed ()
    {
        if let ball = self.view.viewWithTag(100 + lastonLed) as? UIImageView
        {
            ball.image = UIImage(named: "grey.png")
        }
        
        
    }
    @IBOutlet weak var textboxDraw: UITextField!
    
    @IBAction func buttonDraw(sender: AnyObject) {
        timer.invalidate()
        timer  = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(runningLed), userInfo: nil, repeats: true)
        
        if(checkImage == false){
            if(textboxDraw.text != nil){
                n = Int(textboxDraw.text!)!
                drawBall()
                checkImage = true
            }
        }
        else{
            for images in view.subviews{
                if(images.tag == 101){
                    images.removeFromSuperview()//            turnOffLed()
                }
            }
            n = Int(textboxDraw.text!)!
            lastonLed = n - 1
            drawBall()
        }
        
    }
    
    func drawBall() {
        
        
        for indexHang in 0..<n {
            
            for indexCot in 0..<n {
                
                let image = UIImage(named: "green@2x")
                let ball = UIImageView(image: image)
                ball.center = CGPointMake(_margin + CGFloat(indexHang)*(spaceBetweenBall()),
                                          _margin2 + CGFloat(indexCot) * (spaceBetweenBall2()))
                //ball.tag = 101
                ball.tag =  99 + indexHang
                print(ball.tag)
                
                self.view.addSubview(ball)
                
            }
        }
        
        
        
    }
    
    
    // khoang cach theo hang ngang
    func spaceBetweenBall() -> CGFloat
    {
        let space = (self.view.bounds.width - _margin*2) / CGFloat(n-1)
        return space
    }
    
    // khoang cach theo hang doc
    func spaceBetweenBall2() -> CGFloat {
        let space2 = (self.view.bounds.height - _margin2*2) / CGFloat(n-1)
        return space2
    }
    
}

