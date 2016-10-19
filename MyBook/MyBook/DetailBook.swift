//
//  DetailBook.swift
//  MyBook
//
//  Created by anh  nguyen viet on 8/11/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class DetailBook: UIViewController, UIWebViewDelegate, UIScrollViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var myActive: UIActivityIndicatorView!
    
    @IBOutlet weak var showDate: UIButton!
    @IBOutlet weak var totalPageNumber: UILabel!
    @IBOutlet weak var tf_pageNumber: UITextField!
    
    var urlString : String = ""
    var type: String!
    var totalpages: Int!
    
    
    @IBAction func getCurrentTime(sender: AnyObject) {
        
        self.webView.stringByEvaluatingJavaScriptFromString("hello();")
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = urlString // name của quyển sách muốn load
        // set webview delegate
        self.webView.delegate = self
        self.webView.scrollView.delegate = self
        self.tf_pageNumber.delegate = self
        
        
        // Để dữ liệu sách fit với webview
        self.webView.scalesPageToFit = true
        
        // start spinner
        self.myActive.startAnimating()
        var urlpath = "default"
        // load url content trong webview
        switch(type)
        {
        case "PDF" : urlpath = NSBundle.mainBundle().pathForResource(urlString, ofType: "pdf")!
        self.showDate.hidden = true
            
        case "DOCX" : urlpath = NSBundle.mainBundle().pathForResource(urlString, ofType: "docx")!
        self.showDate.hidden = true
        case "HTML" : urlpath = NSBundle.mainBundle().pathForResource(urlString, ofType: "html")!
        self.showDate.hidden = false
        default : break
        }
        let url:NSURL = NSURL.fileURLWithPath(urlpath)
        let urlRequest = NSURLRequest(URL: url)
        let pdf: CGPDFDocumentRef = CGPDFDocumentCreateWithURL(url)!     // create a Core Graphics PDF Document ref using the same NSURL

        totalpages = Int(CGPDFDocumentGetNumberOfPages(pdf))     // use CGPDFDocumentGetNumberOfPages to get the number of pages in the document
        
        //print(totalpages)
        totalPageNumber.text = String(totalpages)
        self.webView.loadRequest(urlRequest)
        
    }
    
    
    
    
    func webViewDidFinishLoad(webView: UIWebView) {
        self.myActive.hidden = true
        self.myActive.stopAnimating()
    }
    func webViewDidStartLoad(webView: UIWebView)
    {
        print("")
    }
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool
    {
        print("")
        return true
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        let pageHeight = webView.scrollView.contentSize.height / CGFloat(totalpages)
        if let page = Int(tf_pageNumber.text!)
        {
        webView.scrollView.contentOffset = CGPointMake(0, CGFloat(page - 1) * pageHeight)
        }
        return true
    }
    
    
}
