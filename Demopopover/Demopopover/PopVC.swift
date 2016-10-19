//
//  PopVC.swift
//  Demopopover
//
//  Created by anh  nguyen viet on 7/23/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class PopVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func buttonaction(sender: AnyObject) {
        if(sender.tag == 101)
        {
                print("like")
        }
        if(sender.tag == 102)
        {
                print("Love")
        }
        if(sender.tag == 103)
        {
            print("haha")
        }

        if(sender.tag == 104)
        {
            print("wow")
        }

        if(sender.tag == 105)
        {
            print("sad")
        }

        if(sender.tag == 106)
        {
            print("angry")
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
