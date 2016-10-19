//
//  DetailVC.swift
//  CustomizeTableViewCell
//
//  Created by anh  nguyen viet on 8/6/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var stringTitle : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.title = stringTitle
        self.imageView.image = UIImage(named: "\(stringTitle).jpg")

    }
}
