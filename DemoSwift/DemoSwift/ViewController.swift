//
//  ViewController.swift
//  DemoSwift
//
//  Created by anh  nguyen viet on 7/20/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        var name = "Nguyen viet anh"
//        name = "viet anh"
//        print ("ten toi la: \(name)")
        
        
//        print(Int.max)
//        print(Int.min)
//
//        print(UInt8.max)
//        print(UInt8.min)
//
//        print(UInt16.max)
//        print(UInt16.min)
// 
//        let float:Float=1.0
//        let int = Int(float)
//        print(int)
//        let numberString="123"
//        let num = Int(numberString)
//        print(num)
//        print(num!)
        
//        let teachmaster = (14, "NguyenDinhChieu")
//        let (sonha, diachi) = teachmaster
//        print("So nha cua toi la: \(sonha)")
//        print("Dia chi cua toi la: \(diachi)")
        
//        let teachmaster = (sonha: 14, diachi:"NguyenDinhChieu")
//        print("So nha la:\(teachmaster.0)")
        
//          var songuyen:Int? = 404
//          songuyen = 0
//          songuyen = nil
//          print(songuyen)
        
          var stringNumber = "123"
        
        // cach 1 : ep kieu roi check
//        let convertedString = Int(stringNumber)
//        
//        if convertedString != nil
//        {
//            print(convertedString)
//        }
        
        // cach 2 dung optinal binding
        
        
        if let tmpNumber = Int(stringNumber), secondNumber = Int("1")
            where tmpNumber > secondNumber
        {
        
        print(tmpNumber)
        print(secondNumber)
        }
        
        
        // phan ve unwrapping
        let ten: String? = "Techmaster"
        let ten2: String 
        
        
        
        

    }
    @IBAction func action_Prin(sender: AnyObject) {
        print("minh an vao dau nay")
        lbl_Noidung.text = "TeachMaster"	
    }

    @IBOutlet weak var lbl_Noidung: UILabel!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

