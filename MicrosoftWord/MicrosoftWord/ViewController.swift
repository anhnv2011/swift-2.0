//
//  ViewController.swift
//  MicrosoftWord
//
//  Created by anh  nguyen viet on 8/6/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class ViewController: UIViewController, OptionDelegate{

    @IBOutlet weak var txt_View: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txt_View.textColor = UIColor.black
    }
    
    //call from PassingOption controller via Deligation
    func setColor(_ color: UIColor)
    {
        txt_View.textColor = color
    }

    
    // duoc goi truoc khi view hien thi
    override func viewWillAppear(_ animated: Bool) {
//        // using singleton
//        let option2 = OptionFont.sharedInstance
//        if let size = option2.size
//        {
//            if let name = option2.fontName
//            {
//                txt_View.font = UIFont(name: name, size: CGFloat(size))
//            }
//        
//        }
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if (segue.identifier == "Options")
        {
            
            // gan thuoc tinh option de ben  View passing co the hien thi du lieu
            let destination = segue.destination as! PassingOptions
            destination.option = OptionFont (size: Int((txt_View.font?.pointSize)!) , fontName: (txt_View.font?.fontName)!, color: (txt_View.textColor)! , aligement: txt_View.textAlignment.rawValue)
            
            
//            //using delegate
//            destination.delegate = self
//            
//            //using NotificationCenter
//            NotificationCenter.default.addObserver(self, selector: #selector(ViewController.alignment(_:)), name: NSNotification.Name(rawValue: "Alignment"), object: nil)
//            NotificationCenter.default.addObserver(self, selector: #selector(ViewController.underlineStyle(_:)), name: NSNotification.Name(rawValue: "BIUSetting"), object: nil)
//            
//            //using Block
//            destination.setStyle({ (para1, para2) -> Void in
//                print("p1:\(para1) p2:\(para2)")
//            })
            
            

        }
        else
        {
            print("unknow error")
        }
        
    }
    
    
    // called from PassingOptions Controller via  NotificationCenter
    
    func alignment(_ notification : Notification)
    
    {
        //dealling with notification.userInfo
        if let info = (notification as NSNotification).userInfo as? Dictionary <String, Int>
        {
            //check if value present  before using it
            if let value  = info["Align"]
            {
                txt_View.textAlignment = NSTextAlignment (rawValue: value)!
                print(value)
            }
            else
            {
                print("no value for key")
            }
            
            
        }
    }
    
    
    
    func underlineStyle(_ value: Int)
    {
        let mutableAttributedString = NSMutableAttributedString.init(string: txt_View.text)
        let range = NSRange.init(location: 0, length: mutableAttributedString.length)
        mutableAttributedString.addAttribute(NSUnderlineStyleAttributeName,value: value, range: range)
        txt_View.attributedText = mutableAttributedString
    }
    
    
    }


