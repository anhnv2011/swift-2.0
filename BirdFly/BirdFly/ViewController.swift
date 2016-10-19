//
//  ViewController.swift
//  BirdFly
//
//  Created by anh  nguyen viet on 7/25/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var bird = UIImageView()
    var audioPlayer = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawJungle()
        addBird()
        flyUpAndDown()
        playSong()
        
    
    }
    
    func drawJungle()
    {
        let background = UIImageView(image: UIImage(named: "jungle.jpg"))
        background.frame = self.view.frame
        background.contentMode = .ScaleAspectFill
        self.view.addSubview(background)
    }
    
    func addBird()
    {
        bird = UIImageView(frame: CGRect(x: 0, y: 0, width: 110, height: 68))
        bird.animationImages = [UIImage (named: "bird0.png")!,
                                UIImage (named: "bird1.png")!,
                                UIImage (named: "bird2.png")!,
                                UIImage (named: "bird3.png")!,
                                UIImage (named: "bird4.png")!,
                                UIImage (named: "bird5.png")!]
        bird.animationRepeatCount = 0 // repeat vo tan
        bird.animationDuration = 1 //toc do load anh
        bird.startAnimating()
        self.view.addSubview(bird)
        //flyUpAndDown()
        
        
    }
    
    func flyUpAndDown()
    {
        UIView.animateWithDuration(2, animations: {
            self.bird.center = CGPointMake(self.view.frame.width - 50, self.view.frame.height - 50)
            
            
            
        }) {(finished) in
            
            self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1), CGAffineTransformMakeRotation(0))
            UIView.animateWithDuration(2, animations: {
            self.bird.center = CGPointMake(0, self.view.frame.height)
                }) {(finished) in
                
                    self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1), CGAffineTransformMakeRotation(125))
                    UIView.animateWithDuration(2, animations: {
                        self.bird.center = CGPointMake(self.view.frame.width, 0)
                    }) {(finished) in
                        
                        
                        self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1), CGAffineTransformMakeRotation(1000))
                        UIView.animateWithDuration(2, animations: {
                            self.bird.center = CGPointMake(0, 0)
                        })
                        {(finished) in
                            self.flyUpAndDown()
                            self.bird.transform = CGAffineTransformIdentity
                        }
                    }



            }
            

            
            }

    }
    
    func playSong()
    
    {
        let filePatch = NSBundle.mainBundle().pathForResource("A+ – Chào Mào Mái Hót", ofType: ".mp3")
        let url = NSURL(fileURLWithPath: filePatch!)
        audioPlayer = try! AVAudioPlayer (contentsOfURL: url)
        audioPlayer.prepareToPlay() //chuan bi mo
        audioPlayer.play()
        
    }
    
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       // Dispose of any resources that can be recreated.
    }


}

