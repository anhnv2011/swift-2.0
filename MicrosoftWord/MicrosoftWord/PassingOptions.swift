//
//  PassingOptions.swift
//  MicrosoftWord
//
//  Created by anh  nguyen viet on 8/8/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

protocol OptionDelegate {
    func  setColor(_ colorName: UIColor);
    
}

class PassingOptions: UIViewController {
    
    @IBOutlet weak var currentSize: UITextField!
    @IBOutlet weak var currentFontName: UITextField!
    @IBOutlet weak var currentColor: UILabel!
    @IBOutlet weak var currentAlign: UILabel!
   
    @IBOutlet weak var currentBIU: UILabel!
    var option: OptionFont!
    var colorLabelText : String! = nil
    var delegate: OptionDelegate! = nil
    
    var completion: ((_ para1: String, _ para2: String) -> (Void))?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        currentSize.text = String(option.size!)
//        currentFontName.text = option.fontName
//        currentColor.backgroundColor = option.color
//        var align = ""
//        switch (option.aligement)
//        {
//            case 0: align = "Lef"
//            case 1: align = "Cen"
//            case 2: align = "Rig"
//            default: break
//        }
//        currentAlign.text = align
    }
    
//    // duoc goi khi view bien mat
//    override func viewWillDisappear(_ animated: Bool) {
//        // using singleton
//        let option1 = OptionFont.sharedInstance
//        option1.size = Int(currentSize.text!)
//        option1.fontName = currentFontName.text
//        
//        
//        self.completion!("1", "2") //block
// 
//    }
    
    //using delegate

    @IBAction func touchUpInsideSelectedColor(_ sender: UIButton) {
        
        if let color = sender.backgroundColor
        {
            currentColor.backgroundColor = color
            delegate.setColor(color)
        }
    }
    
    @IBAction func touchUpInsideSelectedAlign(_ sender: UIButton) {
        
        let dic: NSDictionary = ["Align" : sender.tag - 100]
        print(dic)
        NotificationCenter.default.post(name: Notification.Name(rawValue: "Alignment"), object: nil, userInfo: dic as! [AnyHashable: Any])
       
        var align = ""
        switch (Int(((dic.value(forKey: "Align") as AnyObject).int32Value)!))
        {
        case 0: align = "Lef"
            break
        case 1: align = "Cen"
            break
        case 2: align = "Rig"
            break
        default: break
        }
        currentAlign.text = align


    }
    
    //using Block
    func setStyle(_ completion: ((_ para1: String, _ para2: String) -> Void)?)
    {
        print("action")
        self.completion = completion
    }
    var attrs = [
        NSFontAttributeName : UIFont.systemFont(ofSize: 19.0),
        NSForegroundColorAttributeName : UIColor.red,
        NSUnderlineStyleAttributeName : 1] as [String : Any]
    
    var attributedString = NSMutableAttributedString(string:"")
    
    
    
    @IBAction func touchInsideBoldText(_ sender: UIButton) {
        //currentBIU.font = UIFont.boldSystemFontOfSize(16.0)
       // currentBIU.font = UIFont.italicSystemFontOfSize(16.0)
        let dic: NSDictionary = ["BIU" : Int(sender.tag - 200)]
        print(dic)
       NotificationCenter.default.post(name: Notification.Name(rawValue: "BIUSetting"), object: nil, userInfo: dic as! [AnyHashable: Any])
        var biu = ""
        switch (Int(((dic.value(forKey: "BIU") as AnyObject).int32Value)!))
        {
        case 0: biu = "B"
            break
        case 1: biu = "I"
            break
        case 2: biu = "U"
            break
        default: break
        }
        currentBIU.text = biu
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

