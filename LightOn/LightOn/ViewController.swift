//
//  ViewController.swift
//  LightOn
//
//  Created by anh  nguyen viet on 7/22/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button_light: UIButton!

    var LightIsOn : Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LightIsOn = false
    }

    @IBAction func onTap(sender: AnyObject) {
        
        
        if (LightIsOn==true)
        {
            button_light.setImage(UIImage(named: "LightOn.jpg"), forState: UIControlState.Normal)
            LightIsOn = false
        }
        else
        {
            button_light.setImage(UIImage(named: "LightOff.jpg"), forState: UIControlState.Normal)
            LightIsOn = true
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

