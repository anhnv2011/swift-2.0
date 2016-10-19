//
//  MasterTableVC.swift
//  CustomizeTableViewCell
//
//  Created by anh  nguyen viet on 8/5/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class MasterTableVC: UITableViewController {

    var arrayData: [DataItem]!
    var detailVC: DetailVC!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let item1 : DataItem = DataItem.init(nameFC: "Manschester United", nameStd: "Old Trafford", imgLogo: "MU.png", imgStar: 5)
        
        let item2 : DataItem = DataItem.init(nameFC: "Chelsea", nameStd: "Stamford Bridge", imgLogo: "Chelsea.png", imgStar: 4)
        let item3 : DataItem = DataItem.init(nameFC: "Arsenal", nameStd: "Emirates", imgLogo: "Arsenal.png", imgStar: 4)
        let item4 : DataItem = DataItem.init(nameFC: "Manschester City", nameStd: "Etihat", imgLogo: "MC.png", imgStar: 3)
        let item5 : DataItem = DataItem.init(nameFC: "Liverpool", nameStd: "Anfield", imgLogo: "Liverpool.png", imgStar: 5)
        
    arrayData = [item1, item2, item3, item4, item5]
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayData.count
    }

   
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomCellMaster

        let item: DataItem = arrayData[indexPath.row]
        
        cell.labelFootballClub.text = item.nameFootballClub
        cell.labelStadium.text = item.nameStadium
        cell.imageViewLogo.image = item.imageLogo
        cell.imageViewStarRatting.image = item.imageStarRating
        return cell
    }
    
    // được gọi mỗi khi chon cell
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (detailVC == nil)
        {
           detailVC =  self.storyboard?.instantiateViewControllerWithIdentifier("DetailVC") as! DetailVC
        }
            let item : DataItem = arrayData[indexPath.row]
            detailVC.stringTitle = item.nameStadium
            self.navigationController?.pushViewController(detailVC, animated: true)
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
