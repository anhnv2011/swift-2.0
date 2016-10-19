//
//  ListImages.swift
//  FashionShop
//
//  Created by anh  nguyen viet on 8/3/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class ListImages: UIViewController {

    @IBAction func onTouch(sender: AnyObject)
    {
        switch (sender.tag)
        {
        case 101: pushView(0)
        case 102: pushView(1)
        case 103: pushView(1)
        default: break
        }
        
    }
    
    func pushView(index: Int)
    {
        let listView = self.storyboard?.instantiateViewControllerWithIdentifier("ViewScroll") as? ViewScroll
        //listView?.currentPage = index
        self.navigationController?.pushViewController(listView!, animated: true)
    
    }
}
