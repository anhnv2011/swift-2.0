//
//  ShowDetailVC.swift
//  TetAnGi
//
//  Created by anh  nguyen viet on 8/9/16.
//  Copyright © 2016 DangCan. All rights reserved.
//

import UIKit

class ShowDetailVC: UIViewController {

    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    
    @IBOutlet weak var chiTiet: UITextView!
    var foodNames: String?
    var foodImages: UIImage?
    var chiTiets : String?
    
    var food = MonAn()
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        foodName.text = food.name
        foodImage.image = food.photo
        chiTiet.text = food.chitiet
        
    }
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false

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
