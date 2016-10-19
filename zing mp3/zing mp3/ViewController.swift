//
//  ViewController.swift
//  zing mp3
//
//  Created by anh  nguyen viet on 7/21/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var logo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        logo!.alpha = 0
        text!.alpha = 0
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animateWithDuration(4, animations: {
            self.logo!.alpha = 1
            }) { (finished) in
                UIView.animateWithDuration(3, animations: {
                    self.text!.center = CGPointMake(self.logo!.center.x, 100)
                    self.text!.alpha = 1
                })
        }
    
        
    }
    
    

}

