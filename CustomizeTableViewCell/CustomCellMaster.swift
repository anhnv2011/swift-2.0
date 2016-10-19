//
//  CustomCellMaster.swift
//  CustomizeTableViewCell
//
//  Created by anh  nguyen viet on 8/5/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class CustomCellMaster: UITableViewCell {

    @IBOutlet weak var imageViewLogo: UIImageView!
    @IBOutlet weak var labelFootballClub: UILabel!
    @IBOutlet weak var labelStadium: UILabel!
    
    @IBOutlet weak var imageViewStarRatting: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
