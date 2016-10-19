//
//  BaseTabbarController.swift
//  NavController-TabbarController
//
//  Created by Vinh The on 7/17/16.
//  Copyright © 2016 Vinh The. All rights reserved.
//

import UIKit

class BaseTabbarController: UITabBarController, UITabBarControllerDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = UIColor(red: 0.149, green: 0.2, blue: 0.255, alpha: 1)
        tabBar.translucent = false
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor(),NSFontAttributeName : UIFont (name: "SFUIText-Regular", size: 12)!] , forState: .Normal)
        
    
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        
        //khoi tao 3 vc
        let bookVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("YourBookVC") as! YourBookController
        let homeVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("HomeVC") as! HomeViewController
        let profileVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ProfileVC") as!ProfileViewController
        
        
        // add navigation cho 3 vc, nen tao rieng navigation cho tuwng vc
        
        let bookNav = BaseNavigationController(rootViewController: bookVC)
        let homeNav = BaseNavigationController(rootViewController: homeVC)
        let profileNav = BaseNavigationController(rootViewController: profileVC)
        
        // thuoc tinh viewController cuar tabbar controller. day la thuoc tinh tra ve 1 mang bao gom cac VC nam trong tabbar
        viewControllers = [bookNav ,homeNav , profileNav]
        
        
        settingNavForEachController(bookVC, tranparent: true, navTitle: "Book nav", tabbarTitle: "Book", image: "Book",selectedImage : "Selected-Book")
        settingNavForEachController(homeVC, tranparent: true, navTitle: "Home nav", tabbarTitle: "Home", image: "Home",selectedImage : "Selected-Home")
        settingNavForEachController(profileVC, tranparent: true, navTitle: "Profile nav", tabbarTitle: "Profile", image: "Profile",selectedImage : "Selected-Profile")

        
    }
    
    func settingNavForEachController (viewcontroller :BaseViewController, tranparent : Bool, navTitle : String, tabbarTitle : String, image : String, selectedImage : String )
    {
        viewcontroller.navigationItem.title = navTitle
        viewcontroller.tabBarItem = UITabBarItem(title: tabbarTitle, image: UIImage(named: image)?.imageWithRenderingMode(.AlwaysOriginal), selectedImage: UIImage(named: selectedImage)?.imageWithRenderingMode(.AlwaysOriginal))
        
        
        // imageWithRenderingMode(.AlwaysOriginal) lấy đúng màu gốc của ảnh
        viewcontroller.tranParent = tranparent
    }
    
    
}
