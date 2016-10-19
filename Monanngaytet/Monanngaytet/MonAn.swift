//
//  MonAn.swift
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
    init (name: String, photo: String)
    {
        self.name = name
        self.photo = UIImage(named: "\(photo).jpg")
    }
}
