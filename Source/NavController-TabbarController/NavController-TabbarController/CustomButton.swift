//
//  CustomButton.swift
//  NavController-TabbarController
//
//  Created by Vinh The on 7/15/16.
//  Copyright © 2016 Vinh The. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    func configure() {
        if tag == 101 {
            self.setTitle("LOGIN", forState: .Normal)
        }else if tag == 102{
            self.setTitle("REGISTER", forState: .Normal)
        }
        
        self.titleLabel?.font = UIFont.init(name: "SFUIText-Medium", size: 20)
        self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        backgroundColor = UIColor.init(red: 47/255, green: 129/255, blue: 183/255, alpha: 1)
        
        layer.cornerRadius = 4.0
    }
}
