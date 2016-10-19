//
//  ViewController.swift
//  DemoNSOperation
//
//  Created by anh  nguyen viet on 9/14/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func button_Action(sender: AnyObject) {
        
        let opQ = NSOperationQueue()
        opQ.maxConcurrentOperationCount = 1
        
        let opBlock = NSBlockOperation()
        opBlock.addExecutionBlock { 
            for _ in 0...10
            {
                print("opB1")
            }
        }
        
        opBlock.completionBlock =
        {
            print("Done")
        }
        
        let opBlock2 = NSBlockOperation()
        opBlock2.addExecutionBlock {
            for _ in 0...10
            {
                print("opB2")
            }
        }
        
        opBlock2.completionBlock =
            {
                print("Done2")
        }
        
        
        let opBlock3 = NSBlockOperation()
        opBlock3.addExecutionBlock {
            for _ in 0...10            {
                print("opB3")
            }
        }
        
        opBlock3.completionBlock =
            {
                print("Done3")
        }
        
        
        
        let opBlock4 = NSBlockOperation()
        opBlock4.addExecutionBlock {
            for _ in 0...10
            {
                print("opB4")
            }
        }
        
        opBlock4.completionBlock =
            {
                print("Done4")
        }
        
        
        let opBlock5 = NSBlockOperation()
        opBlock5.addExecutionBlock {
            for _ in 0...10
            {
                print("opB5")
            }
        }
        
        opBlock5.completionBlock =
            {
                print("Done5")
        }
        
        
        
        opBlock.queuePriority = .VeryLow
        opBlock2.queuePriority = .VeryLow
        opBlock3.queuePriority = .VeryLow
        opBlock4.queuePriority = .VeryLow
        opBlock5.queuePriority = .VeryHigh
        //opBlock5.qualityOfService = .UserInteractive // khi thay doi so maxConcurrentOperationCount thi dung
        
        opBlock5.addDependency(opBlock4)
        let opp = Operation(name: "Nguyen viet anh")
        //opQ.addOperation(opp)
        opQ.addOperation(opBlock)
        opQ.addOperation(opBlock2)
        opQ.addOperation(opBlock3)
        opQ.addOperation(opBlock4)
        opQ.addOperation(opBlock5)

    }

    class Operation: NSOperation
    {
        var nameOp: String
        init(name: String) {
            nameOp = name
            super.init()
            
        }
        
        override func main() {
            for _ in 0...1000
            {
                print("op: \(nameOp)")
            }
        }
    }
}

