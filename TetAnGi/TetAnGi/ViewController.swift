//
//  ViewController.swift
//  Monanngaytet
//
//  Created by anh  nguyen viet on 8/9/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    var dataManager = DataManager.sharedInstance
    
    var arrayKey : NSArray!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        self.navigationController?.navigationBarHidden = true

    }
    
    override func viewWillAppear(animated: Bool) {
       self.navigationController?.navigationBarHidden = true

    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.data.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! Cell
        let monAn = dataManager.data[indexPath.item] as! MonAn
        cell.kCellWidth = self.view.frame.size.width
        cell.addSubviews()
        cell.imageViewCell.image = monAn.photo
        cell.nameLabel.text = monAn.name
        return cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            dataManager.data.removeObjectAtIndex(indexPath.item)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    
    
     //nhận sự kiện khi tương tác từng cell
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        performSegueWithIdentifier("ShowDetail", sender: nil)
//    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "ShowDetail")
        {
            let showDetailVC = segue.destinationViewController as! ShowDetailVC
            let selectedRowIndex: NSIndexPath = self.myTableView.indexPathForSelectedRow!
            print(selectedRowIndex)
            
            // Lấy ra cell tương ứng với indexPath
            let selectedCell = self.myTableView.cellForRowAtIndexPath(selectedRowIndex)! as! Cell
            
            print(selectedCell)
//            showDetailVC.foodImages = selectedCell.imageViewCell.image
//            showDetailVC.foodNames = selectedCell.nameLabel.text
            showDetailVC.food = (dataManager.data[selectedRowIndex.item] as? MonAn)!
            
         print(showDetailVC.foodImages)
            // detailVc.food = dataManager.data[selectedRowIndex.Item] as? MonAn
        }
        
    }

    
}

