//
//  GradientView.swift
//  Calculator
//
//  Created by anh  nguyen viet on 7/27/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class GradientView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        if tag == 110
        {
            backgroundColor = UIColor.init(red: 49/255, green: 58/255, blue: 75/255, alpha: 1)
        }

        else        {
            createGradient()
        }
    }
    
    func createGradient() -> Void {
        let bgGradient = CAGradientLayer()
        
        bgGradient.frame = self.frame
        
        bgGradient.colors = [UIColor.init(red: 57/255, green: 120/255, blue: 127/255, alpha: 1.0).CGColor,
                             UIColor.init(red: 77/255, green: 188/255, blue: 201/255, alpha: 1.0).CGColor]
        
        let startPoint = CGPoint.init(x: 0, y: 0)
        let endPoint = CGPoint.init(x: 0.5, y: 0.8)
        
        bgGradient.startPoint = startPoint
        bgGradient.endPoint = endPoint
        
        self.layer.insertSublayer(bgGradient, atIndex: 0)
    }

}
