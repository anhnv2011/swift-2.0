//
//  DetailVC.swift
//  English4Kids
//
//  Created by anh  nguyen viet on 8/5/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class DetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    var stringTitle: String!
    var dictData: NSDictionary!
    var arrayKey : NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        //set title cho nav bar
        self.title = stringTitle
        
        createDataWithName(stringTitle)
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell2")

        // Do any additional setup after loading the view.
    }
    
    
    func createDataWithName (_ title : String)
    {
    // tạo 1 biến lưu đường đẫn đén file plist
        var path: String = ""
        if  (title == "Animal") {
            path = Bundle.main.path(forResource: "AnimalsList", ofType: "plist")!
        }
    
    // lay du lieu tu plis truyen vào dictionary
        dictData = NSDictionary(contentsOfFile: path)!
        
        //lấy tất cả key của dictionary vừa lấy được
        arrayKey = dictData.allKeys as NSArray!
        
        // sắp xếp các phần tử của array theo bảng chữ cái
        arrayKey = arrayKey.sortedArray(using: #selector(NSNumber.compare(_:)))
    
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
    return arrayKey.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath)
        let key: String = arrayKey[(indexPath as NSIndexPath).row] as! String
        
        cell.textLabel?.text = key
        cell.imageView?.image = UIImage(named: "\(dictData[key]!)")
        return cell
    }

    
    // chinh heigjt cua cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    
    // nhận sự kiện khi tương tác từng cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\((indexPath as NSIndexPath).row)  - \(arrayKey[(indexPath as NSIndexPath).row]) ")
        performSegue(withIdentifier: "lastDetail", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "lastDetail")
        {
            let lastDetailVC = segue.destination as! LastDetailVC
            let selectedRowIndex: IndexPath = self.tableView.indexPathForSelectedRow!
            
            // Lấy ra cell tương ứng với indexPath
            let selectedCell: UITableViewCell = self.tableView.cellForRow(at: selectedRowIndex)!
            
            lastDetailVC.nameLabels = selectedCell.textLabel?.text
            lastDetailVC.animalImages = selectedCell.imageView?.image
            
        }
        
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
