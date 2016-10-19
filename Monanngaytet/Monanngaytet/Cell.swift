//
//  Cell.swift
//  Monanngaytet
//
//  Created by anh  nguyen viet on 8/9/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    var nameLabel: UILabel!
    var imageViewCell: UIImageView!
    var kCellWidth: CGFloat = 400
    var kCellHeight: CGFloat = 200
    var kLabelHeight: CGFloat = 50
    
    func addSubviews() {
        if (imageViewCell == nil) {
            imageViewCell = UIImageView(frame: CGRectMake(0, 0, kCellWidth, kCellHeight))
            imageViewCell.layer.borderColor = tintColor.CGColor
            contentView.addSubview(imageViewCell)
        }
        
        if (nameLabel == nil) {
            nameLabel = UILabel(frame: CGRectMake(0, 0, kCellWidth, kLabelHeight))
            nameLabel.textAlignment = .Left
            nameLabel.textColor = UIColor.redColor()
            nameLabel.font = UIFont.boldSystemFontOfSize(16)
            contentView.addSubview(nameLabel)
        }
    }
    
}
