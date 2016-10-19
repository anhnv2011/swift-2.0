//
//  ViewController.swift
//  testGCD
//
//  Created by anh  nguyen viet on 9/15/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // seria queue
        let serialQueue = DispatchQueue(label: "mySerialQueue", attributes: .concurrent)
        
        // Cách tạo 1 concurrent queue
        let concurrentQueue = DispatchQueue(label: "myConcurrentQueue", attributes: [.concurrent])
         
        // Các queue có sẵn trong hệ thống
        let mainQueue = DispatchQueue.main
        let globalQueue = DispatchQueue.global()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

