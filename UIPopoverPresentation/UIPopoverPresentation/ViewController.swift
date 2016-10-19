//
//  ViewController.swift
//  UIPopoverPresentation
//
//  Created by PJ Vea on 5/13/15.
//  Copyright (c) 2015 Vea Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate
{
    
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        //segue for the popover configuration window
        if segue.identifier == "showView" {
            let controller = segue.destinationViewController
            controller.popoverPresentationController!.delegate = self
                controller.popoverPresentationController?.backgroundColor = UIColor.whiteColor()
            controller.preferredContentSize = CGSize(width: 220, height: 30)
            
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return .None
    }
    
}

