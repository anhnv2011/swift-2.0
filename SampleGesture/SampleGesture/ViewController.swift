//
//  ViewController.swift
//  SampleGesture
//
//  Created by anh  nguyen viet on 7/29/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: self, action:Selector ("onTap:"))
        self.view.addGestureRecognizer(tapGesture)
    }

    func onTap(tapGesture: UITapGestureRecognizer)
    {
        let point = tapGesture.locationInView(self.view)
        let snowFlake = UIImageView(image: UIImage(named: "snowflake.png"))
        snowFlake.bounds.size = CGSize (width: 40, height: 40)
        snowFlake.center = point
        self.view.addSubview(snowFlake)
    }
  
}

