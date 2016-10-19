//
//  ContactListVC.swift
//  NSURLSession
//
//  Created by Vinh The on 7/26/16.
//  Copyright © 2016 Vinh The. All rights reserved.
//

import UIKit

let baseURL:String = "http://localhost:2403/information"
class ContactListVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
   
    @IBOutlet weak var myTableView: UITableView!
    
    var informations = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        
        
        navigationItem.title = "Contact List"
        navigationItem.rightBarButtonItem = addBarButton()
        getInformationReques()

    }
    
    // MARK: TableView configuration
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return informations.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ContactCell") as! DetailContactCell
        let person = informations[indexPath.row]
        cell.updateUI(person)
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .Default, title: "DELETE") { (rowAction, indexPath) in
            print("delete")
            self.deleteRequest(indexPath)
        }
        
        delete.backgroundColor = UIColor(red: 244/255, green: 117/255, blue: 100/255, alpha: 1.0)
        
        let edit = UITableViewRowAction(style: .Normal, title: "EDIT") { (rowAction, indexPath) in
            print("edit")
            self.editContact( self.informations[indexPath.row].name!, phone: self.informations[indexPath.row].phone!, city: self.informations[indexPath.row].city!, email: self.informations[indexPath.row].email!, id: self.informations[indexPath.row].id!)
        }
        
        return [delete, edit]
        
    }
    
    func deleteRequest(indexPath: NSIndexPath) {
        let id = informations[indexPath.row].id
        
        print("id la: \(id)")
        
        let urlRequest = NSMutableURLRequest(URL: NSURL(string: baseURL + "/" + id!)!)
        print("url la : \(urlRequest)")
        
        
        urlRequest.HTTPMethod = "DELETE"
        
        let sessionConfigure = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        let session = NSURLSession(configuration: sessionConfigure)
        
        session.dataTaskWithRequest(urlRequest) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }else{
                if let httpResponse = response as? NSHTTPURLResponse{
                    if httpResponse.statusCode == 200{
                        self.informations.removeAtIndex(indexPath.row)
                        
                        dispatch_async(dispatch_get_main_queue(), {
                            self.myTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
                        })
                    }else{
                        print(httpResponse.statusCode)
                    }
                }
            }
            
            }.resume()
    }

    
    //MARK: Get DataRequest
    
    func getInformationReques()
    
    {
        let urlRequest = NSURLRequest(URL: NSURL(string: baseURL)!)
        let session = NSURLSession.sharedSession() // khoi tao
        session.dataTaskWithRequest(urlRequest) { (data, response, error) in
            if let error = error
            {
                print(error.localizedDescription)
            }
            else{
                if let responseHTTP = response as? NSHTTPURLResponse
                {
                    if responseHTTP.statusCode == 200
                    {
                        guard let information = data else {return}
                        print(information)
                        
                        // convert nsdata thanh json
                        do
                        {
                            let result = try NSJSONSerialization.JSONObjectWithData(information, options: NSJSONReadingOptions.AllowFragments)
                            print(result)
                            
                            if let arryResult: AnyObject = result
                            {
                                for inforDict in arryResult as! [AnyObject]
                                {
                                    if let inforDict = inforDict as? [String: AnyObject]
                                    {
                                        print(inforDict)
                                        self.informations.append(Person(information: inforDict))
                                        
                                        //vi tat ca cac request thuc hien o 1 thread khac nen khi muon update phai dua len main thread
                                        dispatch_async(dispatch_get_main_queue(), {
                                            self.myTableView.reloadData()
                                            
                                        })
                                    }
                                }
                            }
                        }
                        
                        catch {}
                    }
                    else
                    {
                        print(responseHTTP.statusCode)
                    }
                }
            }
        
        }.resume() // bat dau qua trinh thuc hien 1 tac vu reques
    }
    
    // MARK: edit
  
    //MARK: Create BarButton
    
    func addBarButton() -> UIBarButtonItem{
        
        let addNewContactBarButton = UIBarButtonItem(image: UIImage(named: "Add New Bar Button")?.imageWithRenderingMode(.AlwaysOriginal), style: .Plain, target: self, action: #selector(addNewContact(_:)))
        
        return addNewContactBarButton
    }
    
    
    //MARK: Show Add and edit view

    func addNewContact(sender : AnyObject) {
        let addNewContact = storyboard?.instantiateViewControllerWithIdentifier("AddNewContactVC") as! AddNewContactVC
        addNewContact.delegate = self
        displayContentController(addNewContact)
        
    }

    func editContact(name: String, phone : Int, city: String, email: String, id: String) {

        let editContact = storyboard?.instantiateViewControllerWithIdentifier("AddNewContactVC") as! AddNewContactVC

        editContact.shownavLabel = "Edit Contact"
        editContact.showButton = "Save"
        
        editContact.showName = name
        editContact.showPhone = phone
        editContact.showCity = city
        editContact.showEmail = email
        editContact.currentID = id
//        print(editContact.navLabel.text)
        editContact.delegate = self
        displayContentController(editContact)
        
    }
// MARK: Create Popup
    
    var blurView : UIView?
    var popUpVC : AddNewContactVC?

    func createBlurView() -> UIView {
        let blurView = UIView(frame: view.bounds)
        blurView.backgroundColor = UIColor.blackColor()
        blurView.alpha = 0.5
        
        return blurView
    }
    
    func displayContentController(content : AddNewContactVC) {
        
        popUpVC = content
        
        blurView = createBlurView()
        let dismissTapGesture = UITapGestureRecognizer(target: self, action: #selector(tapDismissGesture(_:)))
        blurView?.addGestureRecognizer(dismissTapGesture)
        
        view.addSubview(blurView!)
        navigationItem.rightBarButtonItem?.enabled = false
        
        addChildViewController(content)
        content.view.bounds = CGRectMake(0, 0, view.bounds.width / 1.2, view.bounds.height / 1.3)
        content.view.alpha = 0.5
        
        UIView.animateWithDuration(0.3, delay: 0.0, options: UIViewAnimationOptions.TransitionFlipFromBottom, animations: {
            
            content.view.alpha = 1.0
            content.view.center = CGPoint(x: self.view.bounds.width / 2.0, y: self.view.bounds.height / 2.0)
            self.view.addSubview(content.view)
            content.didMoveToParentViewController(self)
            
            }, completion: nil)
        
    }
    
    
    
    
    
    
    
    func animateDismissAddNewContactView(addNewVC : AddNewContactVC) {
        let bounds = addNewVC.view.bounds
        
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            
            addNewVC.view.alpha = 0.5
            addNewVC.view.center = CGPointMake(self.view.bounds.width / 2.0, -bounds.height)
            self.blurView?.alpha = 0.0
            
        }){(Bool) in
            addNewVC.view.removeFromSuperview()
            addNewVC.removeFromParentViewController()
            self.navigationItem.rightBarButtonItem?.enabled = true
            self.blurView?.removeFromSuperview()
        }
        
    }
    
    func tapDismissGesture(tapGesture : UITapGestureRecognizer) {
        animateDismissAddNewContactView(popUpVC!)
    }
    
    
    
    
    
}



extension ContactListVC: AddNewContactDelegate
{
    func dismissAddNewContactController(addnnewVC: AddNewContactVC) {
        animateDismissAddNewContactView(addnnewVC)
        informations.removeAll()
        getInformationReques()
    }
}
