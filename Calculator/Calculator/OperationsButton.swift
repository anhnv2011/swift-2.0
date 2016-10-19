//
//  OperationsButton.swift
//  Calculator
//
//  Created by anh  nguyen viet on 7/27/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class OperationsButton: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    required init?(coder aDecoder: NSCoder )
    {
        super.init(coder: aDecoder)
        configureButton()
    }

    func configureButton() -> Void
    {
    if tag == 101
        {
            backgroundColor = UIColor.init(red: 245/255, green: 165/255, blue: 34/255, alpha: 1)
        }
    else
        {
            backgroundColor = UIColor.init(red: 116/255, green: 219/255, blue: 110/255, alpha: 1)
        }
        
        layer.cornerRadius = 8.0 //bo tron cac nut
        titleLabel?.font = UIFont.systemFontOfSize(20)
        self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
    }
    
}
