//
//  ViewController.swift
//  Login
//
//  Created by anh  nguyen viet on 7/20/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tf_user: UITextField!
    
    @IBOutlet weak var tf_pass: UITextField!
    var users = ["cuong":"123","anh":"456", "son":"789"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        for user in users
//        {
//        print(user.0)
//        print(user)
//            
//        }
        
        
//        for (tendangnhap,matkhau) in users
//        {
//        print(tendangnhap)
//        print(matkhau)
    //    }
    
        let keys = users.keys
        let values = users.values
        for key in keys
        {
        print(key)
        print(values)
        }
        
        
        // them 1 dictionary moi
        users["trung"] = "246"
        
        
        // xoa
        //users.removeAll()
    }
    
   
    @IBAction func action_Dangnhap(sender: AnyObject) {
        
        if let password = users[tf_user.text!]
        {
            if password == tf_pass.text
            {
                print("dang nhap thanh cong")
                
                let tabBar = self.storyboard?.instantiateViewControllerWithIdentifier("tabBar")
                self.navigationController?.pushViewController(tabBar!, animated: true)
            }
            else
            {
            print("dang nhap ko thanh cong")
            }
        }
        
        else
        {
        print("tai khoan ko ton tai")
        }
        
    }

   

}

