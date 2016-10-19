//
//  protocol.swift
//  MyMusic
//
//  Created by anh  nguyen viet on 8/19/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import Foundation

@objc protocol SelectedItem
{
    optional func selectedOrder(id: Int)
}