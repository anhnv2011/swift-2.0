//
//  DetailVC.swift
//  SectionIndex
//
//  Created by anh  nguyen viet on 8/6/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    var person = Person()
    var labelName = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.labelName.frame = CGRectMake(30, 100, 300, 50)
        self.labelName.font = UIFont.boldSystemFontOfSize(25)
        self.labelName.text = person.fullName
        self.view.addSubview(self.labelName)
    }
    
}
