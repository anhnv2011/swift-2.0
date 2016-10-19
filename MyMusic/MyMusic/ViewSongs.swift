//
//  ViewSongs.swift
//  MyMusic
//
//  Created by anh  nguyen viet on 8/16/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class ViewSongs: ViewControllerTableBase, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, SelectedItem
{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        
        self.listView.delegateSelected = self
        listView.hidden = true
        
        myTableView.registerClass(TableViewCellSong.self, forCellReuseIdentifier: "Cell")

        
        txt_Search.delegate = self
        
        
        //items = self.database.viewDatabase("SONGS", columns: ["*"], statement: "")
        getDataSong("")
        getArtistWithSongId()
        
        loadItemsForListView()
        
        super.myTableView.reloadData()
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func getDataSong(statement1: String)
    {
        items = self.database.viewDatabase("SONGS", columns: ["*"], statement: statement1)
        self.myTableView.reloadData()
    }

    
    
//#MARK: TextField Delegate 
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool
    {
        var statement = ""
        //print(string) xem textfield hoat dong nhu the nao
        // Trường hợp string == "" -- nghĩa là đang xóa
        print(textField.text)
        if (string == "")
        {
            if (textField.text!.characters.count > 0)
            {
                statement = (textField.text! as NSString).substringToIndex(textField.text!.characters.count - 1)
            }
            else
            {
                statement = ""
            }
        }
            //Trường hợp tăng string - gõ kí tự
        else
        {
            statement = "\(textField.text!)\(string)"
        }
        self.getDataSong("Where SongName Like '\(statement)%'")
        return true
    }
    
//#MARK: TableView DataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.myTableView.dequeueReusableCellWithIdentifier("Cell") as! TableViewCellBase
       
        let currentItem = items[indexPath.row]
        cell.img_Detail.image = UIImage(named: currentItem["UrlImg"] as! String)
        cell.lbl_name.text = currentItem.objectForKey("SongName") as? String!
        cell.lbl_info.text = nameArtist[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 84
    }
    
    
    override func chooseOrder() // ham viet ben viewcontrollerbase
    {
        //getDataSong("Order by SongName ASC")
        if(listView.hidden == true)
        {
            listView.hidden = false
            //checkListViewHidden = false
        }
        else
        {
            listView.hidden = true
            //checkListViewHidden = true
        }
    }
    
    
    func loadItemsForListView()
    {
        //itemsOfListView
        itemsOfListView = [Label(displayName: "Name", id: 1, column: "SongName"), Label(displayName: "ID", id: 2, column: "ID")]
        
        
        //listView.items = [Label(displayName: "Name", id: 1, column: "SongName"), Label(displayName: "ID", id: 2, column: "ID")]
    }
    
//#MARK: Protocol Selected
    func selectedOrder(id: Int) {
        //print(id)
        
        getDataSong("Order by \(self.itemsOfListView[id - 1].column) ASC")

    }

}
