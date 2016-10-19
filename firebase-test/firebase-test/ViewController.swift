//
//  ViewController.swift
//  firebase-test
//
//  Created by anh  nguyen viet on 9/8/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var tf_User: UITextField!
    @IBOutlet weak var tf_Pass: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

    }

    @IBAction func button_Login(sender: AnyObject) {
    
        if let email = tf_User.text, let pass = tf_Pass.text
        {
            if email == "" || pass == ""
            {
                print("Nhap user pass")
                
            }
            else
            {
                FIRAuth.auth()?.signInWithEmail(email, password: pass, completion: {(user: FIRUser?, error: NSError?) in
                    if error != nil
                    {
                        print("ko the dang nhap: \(error)")
                    }
                
                    else
                    {
                        print("Succes, \(user?.email) ")
                        self.performSegueWithIdentifier("show", sender: nil)

                    }
                })
            }
        }
    }
    
    @IBAction func button_Signup(sender: AnyObject) {
        
        if let email = tf_User.text, let pass = tf_Pass.text
        {
            if email == "" || pass == ""
            {
                print("Nhap user pass")
                
            }
            else
            {
                FIRAuth.auth()?.createUserWithEmail(email, password: pass, completion: {(user: FIRUser?, error: NSError?) in
                    if error != nil
                    {
                        print("ko the tao: \(error)")
                    }
                    else
                    {
                        self.performSegueWithIdentifier("show", sender: nil)
                    }
                    
                })
            }
        }
    }
    
    
    @IBAction func button_Forgot(sender: UIButton) {
        print("11")
        let alert = UIAlertController (title: "Forgot Password", message: "Enter your email", preferredStyle: .Alert)
        var myText : UITextField?
        alert.addTextFieldWithConfigurationHandler { (textField : UITextField) in
            myText = textField
        }
        
        let action = UIAlertAction (title: "Send Request ", style: .Default) { (action: UIAlertAction) in
            print("send request to :\(myText?.text)")
            FIRAuth.auth()?.sendPasswordResetWithEmail ((myText?.text)!, completion: { (error : NSError?) in
                if error != nil
                {
                    print("loi reset password \(error)")
                    
                }
                
                else
                {
                    print("Reset success")
                }
            })
        }
            alert.addAction(action)
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let userVc = segue.destinationViewController as! UserVC
        let currentUser = FIRAuth.auth()?.currentUser
        if currentUser?.displayName != nil
        {
            userVc.displayname = currentUser?.displayName
        
        }
        else
        {
            userVc.displayname = "Update your profile"
        }
    }
    }
    

