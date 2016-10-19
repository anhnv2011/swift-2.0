//
//  BaseViewController.swift
//  NavController-TabbarController
//
//  Created by Vinh The on 7/16/16.
//  Copyright © 2016 Vinh The. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
    }
    
    //? de ep kieu optional
    var tranParent : Bool?
        {
        didSet {
            if tranParent == true
            {
            setTranparentForUINavigtionBar()
            }
        }
    
    }
    
    
    // ham set navigationbar mo di (tu viet)
    func setTranparentForUINavigtionBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default) // set background image la rong
        navigationController?.navigationBar.shadowImage = UIImage() // set shadow image la rong
    
    }
    
    // MARK: Update Contraints
    
    
    
    var setTitleForBackButton : String?
    {
        didSet
        {
            guard let title = setTitleForBackButton else {return}
            setTitleForBackButton(title)
        }
    	
    }
    
    func setTitleForBackButton (title: String)
    {
        let backButton = UIBarButtonItem()
        backButton.title = title
        navigationItem.backBarButtonItem = backButton
    
    }
    
    func updateContraint(contraint : NSLayoutConstraint!){
        print(contraint.constant)
        
        let scale = UIScreen.mainScreen().bounds.size.height / 667
        
        contraint.constant = contraint.constant * scale
        
        print(contraint.constant)
    }
    
}
