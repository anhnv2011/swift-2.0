//
//  ViewControllerBase.swift
//  MyMusic
//
//  Created by anh  nguyen viet on 8/16/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class ViewControllerBase: UIViewController {
    var btn_Title: UIButton!
    var txt_Search: UITextField!
    var items = [NSDictionary]()
    
    var itemsOfListView:[Label]!
    
    var database = DataBase()
    
    
    var listView = ListView(frame: CGRectMake(0, 0, 0, 0), style: .Plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBtn_Title()
        addTxt_Search()
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setActionForRightBarButton()
        

    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        addListViewOrder()
        //addBtn_Title()

    }
    func setActionForRightBarButton()
    {
        self.tabBarController?.navigationItem.rightBarButtonItem?.target = self
        self.tabBarController?.navigationItem.rightBarButtonItem?.action = #selector(checkHiddenSearch)
    
    }
    func checkHiddenSearch()
    {
        if (txt_Search.hidden == true)
        {
            UIView.transitionWithView(self.txt_Search, duration: 0.5, options: .TransitionCurlDown, animations: nil, completion: nil)
            listView.hidden = true
        }
        else
        {
            UIView.transitionWithView(self.txt_Search, duration: 0.5, options: .TransitionFlipFromLeft, animations: nil, completion: nil)
        }
        
        txt_Search.hidden = !txt_Search.hidden
        txt_Search.resignFirstResponder() // bỏ con trỏ nhấp nháy ở textfield
    }
    
    
    func addTxt_Search()
    {
        txt_Search = UITextField()
        txt_Search.hidden = true
        txt_Search.borderStyle = .RoundedRect // bo tròn
        txt_Search.placeholder = "Enter name here"
        self.view.addSubview(txt_Search)
        
        txt_Search.translatesAutoresizingMaskIntoConstraints = false
        
        
        //constrain
        let cn1 = NSLayoutConstraint(item: txt_Search, attribute: .Leading, relatedBy: .Equal, toItem: self.view, attribute: .Leading, multiplier: 1.0, constant: 0)
        let cn2 = NSLayoutConstraint(item: txt_Search, attribute: .Trailing, relatedBy: .Equal, toItem: self.view, attribute: .Trailing, multiplier: 1.0, constant: 0)
        let cn3 = NSLayoutConstraint(item: txt_Search, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 40)
        let cn4 = NSLayoutConstraint(item: txt_Search, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute:.Top, multiplier: 1, constant: 64)
        
        NSLayoutConstraint.activateConstraints([cn1, cn2, cn3, cn4])
    }

    func addBtn_Title()
    {
        btn_Title = UIButton()
        btn_Title.setTitle("Name", forState: .Normal)
        btn_Title.setTitleColor(UIColor.redColor(), forState: .Highlighted)
        btn_Title.addTarget(self, action: #selector(chooseOrder), forControlEvents: .TouchUpInside)
        btn_Title.backgroundColor = UIColor.blackColor()
        self.view.addSubview(btn_Title)
        
        //contraint 
        btn_Title.translatesAutoresizingMaskIntoConstraints = false
        // .leding cho no bên trái view tổng
        let cn1 = NSLayoutConstraint(item: btn_Title, attribute: .Leading, relatedBy: .Equal, toItem: self.view, attribute: .Leading, multiplier: 1.0, constant: 0)
        let cn2 = NSLayoutConstraint(item: btn_Title, attribute: .Trailing, relatedBy: .Equal, toItem: self.view, attribute: .Trailing, multiplier: 1.0, constant: 0)
        let cn3 = NSLayoutConstraint(item: btn_Title, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 40)
        let cn4 = NSLayoutConstraint(item: btn_Title, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute:.Top, multiplier: 1, constant: 64)
        
        NSLayoutConstraint.activateConstraints([cn1, cn2, cn3, cn4])
    }
    	
    
    func chooseOrder()
    {
    print("Click")
    }
    
    
    
    
    //# MARK: Listview
    func addListViewOrder ()
    {
        
        //listView = ListView()
        listView.items = itemsOfListView

        self.view.addSubview(listView)
        listView.translatesAutoresizingMaskIntoConstraints = false
        
        let cn1 = NSLayoutConstraint(item: listView, attribute: .CenterX, relatedBy: .Equal, toItem: btn_Title, attribute: .CenterX, multiplier: 1.0, constant: 0)
        let cn2 = NSLayoutConstraint(item: listView, attribute: .Top, relatedBy: .Equal, toItem: btn_Title, attribute: .Bottom, multiplier: 1.0, constant: 0)
        let cn3 = NSLayoutConstraint(item: listView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 100)
        let cn4 = NSLayoutConstraint(item: listView, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 200)
        
        NSLayoutConstraint.activateConstraints([cn1, cn2, cn3, cn4])

    }
    
}

