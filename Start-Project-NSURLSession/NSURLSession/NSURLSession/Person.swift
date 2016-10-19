//
//  Person.swift
//  NSURLSession
//
//  Created by anh  nguyen viet on 9/19/16.
//  Copyright © 2016 Vinh The. All rights reserved.
//

import UIKit

class Person: NSObject {

    var id : String?
    var name: String?
    var phone: Int?
    var email: String?
    var city: String?
   
    init (information : [String: AnyObject])
    {
    
        let id = information["id"] as? String
        self.id = id
        let name = information["Name"] as? String
        self.name = name
        let phone = information["PhoneNumber"] as? Int
        self.phone = phone
        let email = information["Email"] as? String
        self.email = email
        let city = information["City"] as? String
        self.city = city
    }
}
