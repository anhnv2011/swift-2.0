//
//  AddNewContactVC.swift
//  NSURLSession
//
//  Created by Vinh The on 7/27/16.
//  Copyright © 2016 Vinh The. All rights reserved.
//

import UIKit

protocol  AddNewContactDelegate {
    
    func dismissAddNewContactController(addnnewVC : AddNewContactVC)
    
}

class AddNewContactVC: UIViewController{
    
    @IBOutlet weak var bannerView: UIView!
    
    @IBOutlet weak var nameTextField: CustomTextField!
    
    @IBOutlet weak var phoneTextField: CustomTextField!
    
    @IBOutlet weak var cityTextField: CustomTextField!
    
    @IBOutlet weak var emailTextField: CustomTextField!
    
    @IBOutlet weak var button_action: UIButton!
    @IBOutlet weak var navLabel: UILabel!
    
    @IBOutlet weak var addButton: UIButton!
    var shownavLabel = "Add New Contact"
    var showName = ""
    var showPhone = 0
    var showCity = ""
    var showEmail = ""
    var showButton = "Add"
    var currentID = ""
    
    var delegate : AddNewContactDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        navLabel.text = shownavLabel
        nameTextField.text = showName
        phoneTextField.text = String(showPhone)
        cityTextField.text = showCity
        emailTextField.text = showEmail
        button_action.setTitle(showButton, forState: .Normal)
        nameTextField.delegate = self
        phoneTextField.delegate = self
        cityTextField.delegate = self
        emailTextField.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setMask(view, rectCorner: [.BottomLeft,.BottomRight, .TopLeft, .TopRight], radius: CGSizeMake(20.0, 20.0))
        setMask(bannerView, rectCorner: [.TopLeft, .TopRight], radius: CGSizeMake(20.0, 20.0))
        
    }
    func createNewContractRequest(name: String, phone: Int, city: String?, email: String?)
    {
    
        var pram : [String: AnyObject] = ["Name": name, "PhoneNumber": phone]
        if city != nil{
            pram["City"] = city
        }
        if email != nil{
            pram["Email"] = email
        }
        
        
        let urlRequest = NSMutableURLRequest (URL: NSURL(string: baseURL)!)
        urlRequest.HTTPMethod = "POST"
        let configureSession = NSURLSessionConfiguration.defaultSessionConfiguration()
        configureSession.HTTPAdditionalHeaders = ["Content-Type" : "application/json"]
        
        let createContactSession = NSURLSession(configuration: configureSession)
        
        let passData = try! NSJSONSerialization.dataWithJSONObject(pram, options: NSJSONWritingOptions.PrettyPrinted)
        
        createContactSession.uploadTaskWithRequest(urlRequest, fromData: passData) { (data, response, error) in
            if let error = error
            {
                print(error.localizedDescription)
            }
            else
            {
                if let responseHTTP = response as? NSHTTPURLResponse
                {
                    if responseHTTP.statusCode == 200
                    {
                        print(data)
                        
                        
                        //update lai UI
                        dispatch_async(dispatch_get_main_queue(), { 
                            self.delegate?.dismissAddNewContactController(self)
                        })
                    }
                    else
                    {
                        print(responseHTTP.statusCode)
                    }
                }
            }
        }.resume()
    }
   
    // MARK: edit
    
    func editContactRequest(name : String, phone : Int, city : String?, email: String?, id : String){
        
        var param : [String:AnyObject] = ["Name": name, "PhoneNumber" : phone]
        
        if city != nil{
            param["City"] = city
        }
        if email != nil{
            param["Email"] = email
        }
        
        let urlRequest = NSMutableURLRequest(URL: NSURL(string: baseURL + "/" + id)!)
        print("urlRequest la : \(urlRequest)")
        urlRequest.HTTPMethod = "PUT"
        
        let configureSession = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        configureSession.HTTPAdditionalHeaders = ["Content-Type":"application/json"]
        
        let createContactSession = NSURLSession(configuration: configureSession)
        
        let dataPassing = try! NSJSONSerialization.dataWithJSONObject(param, options: NSJSONWritingOptions.PrettyPrinted)
        
        createContactSession.uploadTaskWithRequest(urlRequest, fromData: dataPassing) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }else{
                if let httpResponse = response as? NSHTTPURLResponse{
                    if httpResponse.statusCode == 200{
                        print("Data : \(data)")
                        
                        dispatch_async(dispatch_get_main_queue(), {
                            self.delegate?.dismissAddNewContactController(self)
                        })
                        
                    }else{
                        print(httpResponse.statusCode)
                    }
                }
            }
            }.resume()
        
    }
    
    
    
    
    // MARK: Create corner roundrect.
    
    func setMask(view : UIView, rectCorner : UIRectCorner, radius : CGSize){
        let maskPath = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: rectCorner, cornerRadii: radius)
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.CGPath
        maskLayer.borderWidth = 1.0
        maskLayer.borderColor = UIColor.blackColor().CGColor
        
        view.layer.mask = maskLayer
        
    }
    
    @IBAction func addNewContactAction(sender: AnyObject) {
        if showButton == "Add"
        {
            if let name = nameTextField.text, phone = Int(phoneTextField.text!)
            {
                createNewContractRequest(name, phone: phone, city: cityTextField.text, email: emailTextField.text)
            }
            else
            {
                print("no name no phone")
            }
        }
        
        else
        {
            editContactRequest(nameTextField.text!, phone: Int(phoneTextField.text!)!, city: cityTextField.text, email: emailTextField.text!, id: currentID)
        }
    }
}


extension AddNewContactVC : UITextFieldDelegate{
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.setValue(UIColor.clearColor(), forKeyPath: "_placeholderLabel.textColor")
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        textField.setValue(UIColor.blackColor(), forKeyPath: "_placeholderLabel.textColor")
    }
}
