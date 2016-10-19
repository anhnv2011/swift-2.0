//
//  ViewControllerTableBase.swift
//  MyMusic
//
//  Created by anh  nguyen viet on 8/16/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class ViewControllerTableBase: ViewControllerBase {
    
    var myTableView = UITableView()
    var nameArtist = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        addTableView()
    }
    func addTableView()
    {
        myTableView.backgroundColor = UIColor.brownColor()
        self.view.addSubview(myTableView)
        self.myTableView.translatesAutoresizingMaskIntoConstraints = false
        
        let cn1 = NSLayoutConstraint(item: myTableView, attribute: .Leading, relatedBy: .Equal, toItem:self.view, attribute: .Leading, multiplier: 1.0, constant: 0)
        let cn2 = NSLayoutConstraint(item: myTableView, attribute: .Trailing, relatedBy: .Equal, toItem:self.view, attribute: .Trailing, multiplier: 1.0, constant: 0)
        let cn3 = NSLayoutConstraint(item: myTableView, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1.0, constant: 104) // 40 (chieu cao cua textfield) + 64 cach top
        let cn4 = NSLayoutConstraint(item: myTableView, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0)
        NSLayoutConstraint.activateConstraints([cn1, cn2, cn3, cn4])
        
    }
    
    func getArtistWithSongId()
    {
        for song in items
        {
            let detail = database.viewDatabase("DETAILALBUM", columns: ["ARTISTS.ArtistName"], statement: "JOIN ARTISTS on DETAILALBUM.ArtistID = ARTISTS.ID where SONGID = \(song["ID"]!)")
            nameArtist.append(detail.first!["ArtistName"] as! String)
       }
    }
}
