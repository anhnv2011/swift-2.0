//
//  DataItem.swift
//  CustomizeTableViewCell
//
//  Created by anh  nguyen viet on 8/5/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class DataItem
{
    var imageLogo: UIImage!
    var nameFootballClub : String!
    var nameStadium : String!
    var imageStarRating: UIImage!
    
    
    init (nameFC: String, nameStd: String, imgLogo: String, imgStar: Int)
    {
        self.imageLogo = UIImage(named: imgLogo)
        self.imageStarRating = UIImage(named: "\(imgStar)stars.png")
        self.nameFootballClub = nameFC
        self.nameStadium = nameStd  
    }
}   