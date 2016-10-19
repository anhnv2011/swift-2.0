//
//  ViewController.swift
//  Monanngaytet
//
//  Created by anh  nguyen viet on 8/9/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import Foundation
import UIKit
class MonAn {
    var name : String?
    var photo :  UIImage?
    var chitiet : String?
    init (name: String, photo: String, chitiet: String)
    {
        self.name = name
        self.photo = UIImage(named: "\(photo).jpg")
        self.chitiet = chitiet
    }
    init(){}
}

