//
//  LastDetailVC.swift
//  English4Kids
//
//  Created by anh  nguyen viet on 8/5/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class LastDetailVC: UIViewController {


    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var animalImage: UIImageView!
    var nameLabels: String?
    var animalImages : UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = nameLabels
        animalImage.image = animalImages
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
