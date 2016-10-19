//
//  Item.swift
//  testUIScrollView
//
//  Created by anh  nguyen viet on 8/10/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import Foundation
import UIKit

class Item{
    var name: String?
    var content: String?
    var nameImages: [String] = []
    var price: String?
    init(name: String, content: String, nameImages: [String], price: String)
    {
        self.name = name
        self.content = content
        self.nameImages = nameImages
        self.price = price
    
    }
    
    
}