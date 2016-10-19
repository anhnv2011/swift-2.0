//
//  YourBookController.swift
//  NavController-TabbarController
//
//  Created by Vinh The on 7/16/16.
//  Copyright © 2016 Vinh The. All rights reserved.
//

import UIKit

class YourBookController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let cameraButtonItem = UIBarButtonItem(barButtonSystemItem: .Camera, target: self, action: #selector(takeAPicture(_:)))
        
 //       navigationItem.leftBarButtonItem = cameraButtonItem
//        
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: nil)
//        navigationItem.leftBarButtonItem = addButton
        
        self.navigationItem.setLeftBarButtonItems([cameraButtonItem,addButton], animated: true)
        
        let rightButton = UIBarButtonItem(image: UIImage(named: "EMAIL"), style: .Plain, target: self, action: #selector(sentEmail(_:)))
        navigationItem.rightBarButtonItem = rightButton
    }
    func takeAPicture(sender: AnyObject)
    {
        print("Taking a Picture")
    }
    
    func sentEmail(sender: AnyObject)
    {
        print("Sent")

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
