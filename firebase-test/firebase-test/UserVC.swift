//
//  UserVC.swift
//  firebase-test
//
//  Created by anh  nguyen viet on 9/9/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit
import Firebase
class UserVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var button_avatar: UIButton!
    @IBOutlet weak var lb_name: UILabel!
    @IBOutlet weak var myTableView: UITableView!
    
    var displayname: String?
    
    var avatarImgURl : String?
    let data: [String] = ["Update Profile", "Change Password", "Delete User" ]
    override func viewDidLoad() {
        super.viewDidLoad()
        button_avatar.layer.cornerRadius = button_avatar.frame.size.width / 2
        button_avatar.clipsToBounds = true
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        lb_name.text = displayname
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = myTableView.cellForRowAtIndexPath(indexPath)
        
        let cellName = cell?.textLabel?.text
        if cellName == "Delete User"
        {
            let user = FIRAuth.auth()?.currentUser
            user?.deleteWithCompletion ({(error: NSError?) in
                if error != nil
                {
                    print("Ko the delete")
                }
                else
                {
                    print("Deletes success")
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
            
            })
        }
        
        
        else if cellName == "Change Password"

        {
            let alert = UIAlertController (title: "Change Password", message: "Enter your password", preferredStyle: .Alert)
            var myText : UITextField?
            alert.addTextFieldWithConfigurationHandler { (textField : UITextField) in
                myText = textField
            }
            
            let action = UIAlertAction (title: "Confirm", style: .Default) { (action: UIAlertAction) in
                let currentuser = FIRAuth.auth()?.currentUser
                let newPassword = myText?.text
                currentuser?.updatePassword ( newPassword!, completion: { (error: NSError?) in
                    
            
                    if error != nil
                    {
                        print("loi reset password \(error)")
                        
                    }
                        
                    else
                    {
                        print("Change success")
                    }
                })
            }
            alert.addAction(action)
            self.presentViewController(alert, animated: true, completion: nil)
        
        }
        
        else if cellName == "Update Profile"
        
        {
            let alert = UIAlertController (title: "Update Profile", message: "Enter new profile ", preferredStyle: .Alert)
            var tf_DisplayName : UITextField?
            var tf_ImgUrl : UITextField?
            
            alert.addTextFieldWithConfigurationHandler ({ (textField : UITextField) in
                tf_DisplayName = textField
            })
            alert.addTextFieldWithConfigurationHandler ({ (textField : UITextField) in
                tf_ImgUrl = textField
            })
            //http://bit.ly/2cpY7Lr
            
            let action = UIAlertAction (title: "Confirm", style: .Default , handler: { (action: UIAlertAction) in
                
                self.avatarImgURl = tf_ImgUrl?.text
                let currentuser = FIRAuth.auth()?.currentUser
                let changeRequest = currentuser?.profileChangeRequest()
                changeRequest?.displayName = tf_DisplayName?.text
                changeRequest?.photoURL = NSURL (string: (tf_ImgUrl?.text)!)
                changeRequest?.commitChangesWithCompletion({ (error:NSError?) in
                    
                    
                    if error != nil
                    {
                        print("ko the thay doi \(error)")
                        
                    }
                        
                    else
                    {
                        print("Thay doi thanh cong")
                    }
                })
                
            })

        
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
        
        
        }
    
    }
    
    @IBAction func button_avatar(sender: AnyObject) {
    }

    @IBAction func button_logout(sender: AnyObject) {
        
        do
        {
            try!  FIRAuth.auth()?.signOut()
            dismissViewControllerAnimated(true, completion: nil)
        }
        catch
        {
            print("Something Wrong")
        }
    }
    
    
    
    
    
}
