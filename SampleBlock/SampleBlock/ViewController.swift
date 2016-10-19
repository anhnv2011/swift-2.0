//
//  ViewController.swift
//  SampleBlock
//
//  Created by anh  nguyen viet on 9/8/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var block1: (()->())?
    var block2 = {(p1: Int) -> () in print(p1 + 1)}
    
    
    var imgs = ["https://i.ytimg.com/vi/yIZlTHgfFYw/maxresdefault.jpg", "http://news.xinhuanet.com/fashion/2012-12/19/124106746_131n.jpg",
                "https://s-media-cache-ak0.pinimg.com/736x/3f/a1/62/3fa162dbd33effa671b5e5a820952c88.jpg", "http://top10for.com/wp-content/uploads/2015/02/Hottest-Victoria%E2%80%99s-Secret-Models1.jpg"]

    override func viewDidLoad() {
        super.viewDidLoad()
        block2(999)
        printSomething(10) { 
            () in print("Closure da hoan thanh")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func printSomething (_ p1: Int, complete: () -> ())
    {
        print(p1)
        complete()
    
    }
    
    
    func loadData (_ completion : (_ data: Data, _ index: Int) -> ())
        
    {
        
        // load anh
//        dispatch_async(dispatch_get_global_queue(0, 0)) {
//            for stringUrl in self.imgs
//            {
//                if let  url = NSURL(string: stringUrl)
//                {
//                    if let data = NSData(contentsOfURL: url)
//                    {
//                        completion(data: data, index: self.imgs.indexOf(stringUrl)!)
//                    }
//                    
//                }
//            }
//            
//        }
        
        
        
//        let group = dispatch_group_create()
//        
//        dispatch_group_enter(group) // báo tác vụ bắt đầu xử lí thì enter group vào
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { 
//            for index in 0...1000000
//            {
//                print(index)
//            
//            }
//            //sau khi xử li
//            dispatch_group_leave(group) // bao tac vu da hoan thanh
//        }
//        
//        
//        //dispatch_group_wait(group, DISPATCH_TIME_FOREVER) // doi cac tac vu thanh cong, khoa cac tac vu khac , timeout la thoi gian no cho doi
////         dispatch_group_wait(group, dispatch_time(DISPATCH_TIME_NOW, 2 * Int64(NSEC_PER_SEC)))
////        print("Done")
//        
//        dispatch_group_notify(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { 
//            print("done") // dung notify cac tac vu khac van co the thuc hien, man hinh ko bi khoa
//            
//        }
        
        
//        let  queue = dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT)
//        for index in 0...10
//        {
////            dispatch_async(queue, {
////                
////            })
//        
//            if (index == 5) {
//                dispatch_barrier_async(queue, { 
//                    for index2 in 0...10
//                    {
//                        print("Q1: \(index2)")
//                    }
//                })
//            }
//            
//            else
//            {
//                dispatch_async(queue, {
//                    for index3 in 0...10
//                    {
//                        print(index3)
//   
//                    }
//                })
//            }
//            
//        
//        }
        

        
  
        
        let queue = DispatchQueue.global(priority: 0)
        queue.asyncAfter(deadline: DispatchTime.now() + Double(10 * Int64(NSEC_PER_SEC)) / Double(NSEC_PER_SEC)  ) { 
            print("Hello")
        }
    
    }

    @IBAction func button_Load (_ sender: AnyObject)
    {
        DispatchQueue.main.async {
            self.loadData({ (data, index) in
                if let imgView = self.view.viewWithTag(100 + index) as? UIImageView
                {
                    imgView.image = UIImage(data: data)
                }
            })

        }
        
    }

    @IBAction func button_Print(_ sender: AnyObject) {
        print("Anhnv")
    }
}

