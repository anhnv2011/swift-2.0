//
//  ViewHome.swift
//  testUIScrollView
//
// Created by anh  nguyen viet on 8/2/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//
import UIKit

class ViewHome: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var items: [Item] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        var myDict: NSDictionary?
        if let path = NSBundle.mainBundle().pathForResource("items", ofType: "plist")
        {
            myDict = NSDictionary(contentsOfFile: path)
        }
        for dic in myDict!.allValues
        {
            items.append(Item(name: dic["name"] as! String, content: dic["content"] as! String, nameImages: dic["images"] as! NSArray as! [String], price: dic["price"] as! String))
        }
    }

    
    // trả về số section của collection view
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return items.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CellItem
        cell.addSubviews(true)
        //let img = UIImageView(image: UIImage(named: items[indexPath.item].nameImages[0] + ".jpg"))
//        img.frame = CGRectMake(0,0,100,100)
//        img.contentMode = .ScaleAspectFit
//        //cell.addSubview(img)
//        cell.contentView.addSubview(img)
        cell.imageView.image = UIImage(named: items[indexPath.item].nameImages[0] + ".jpg")
        cell.nameLabel.text = items[indexPath.item].name
        cell.price.text = items[indexPath.item].price
        return cell
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let listView = self.storyboard?.instantiateViewControllerWithIdentifier("ShowDetail") as! ListImages
        listView.item = items[indexPath.item]
        self.navigationController?.pushViewController(listView, animated: true)
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
