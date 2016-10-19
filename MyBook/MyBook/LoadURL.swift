//
//  LoadURL.swift
//  MyBook
//
//  Created by anh  nguyen viet on 8/11/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class LoadURL: UIViewController, UITextFieldDelegate, UIWebViewDelegate {
    
    @IBOutlet weak var urlString: UITextField!
    @IBOutlet weak var myActivity: UIActivityIndicatorView!
    @IBOutlet weak var webView: UIWebView!
    
    let baseUrl = "http://www."
    override func viewDidLoad() {
        myActivity.hidden = true
        self.webView.delegate = self
        self.urlString.delegate = self
        //urlString.autocorrectionType = UITextAutocorrectionTypeNo;
        urlString.autocorrectionType = .No
        super.viewDidLoad()
    }
    
    @IBAction func goFoward(sender: AnyObject) {
        self.webView.goForward()
    }
    @IBAction func goBack(sender: AnyObject) {
        self.webView.goBack()
    }
    
    @IBAction func reload(sender: AnyObject) {
        self.webView.reload()
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        myActivity.hidden = false
        let url = NSURL(string: baseUrl + textField.text!)!
        let urlRequest = NSURLRequest(URL: url)
        self.webView.loadRequest(urlRequest)
        myActivity.startAnimating()
        return true
    }
    
    
    
    func webViewDidFinishLoad(webView: UIWebView)
    {
        myActivity.hidden = true
        myActivity.stopAnimating()
    }
    
}
