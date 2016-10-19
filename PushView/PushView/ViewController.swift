//
//  ViewController.swift
//  PushView
//
//  Created by anh  nguyen viet on 7/25/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func action_Push(sender: AnyObject) {
        let v2 = self.storyboard?.instantiateViewControllerWithIdentifier("V2") as! View2
        self.navigationController?.pushViewController(v2, animated: true)
    }

}

	