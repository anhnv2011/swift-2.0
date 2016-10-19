//
//  ListImages.swift
//  testUIScrollView
//
//  Created by anh  nguyen viet on 8/2/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//
//

import UIKit

class ListImages: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    @IBOutlet weak var nameShop: UILabel!
    
    @IBOutlet weak var imgProfile: UIImageView!
    
    @IBOutlet weak var contentShop: UITextView!
    
    @IBOutlet weak var collectionImage: UICollectionView!
    //chứa các thông tin cần hiển thị ở đối tượng Item, xem lại bài scrollview
    
    var item: Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameShop.text = item.name
        contentShop.text = item.content
        imgProfile.image = UIImage(named: item.nameImages[0]+".jpg")
        imgProfile.userInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: Selector("tapImg"))
        imgProfile.addGestureRecognizer(tap)
    }
    func tapImg()
    {
        pushView(0)
    }
    func pushView(index: Int)
    {
        let listView = self.storyboard?.instantiateViewControllerWithIdentifier("ViewScroll") as? ViewScroll
        listView?.pageImages = item.nameImages
        listView?.currentPage = index
        self.navigationController?.pushViewController(listView!, animated: true)
    }
    //delegate uicollectionView
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.nameImages.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell1", forIndexPath: indexPath) as! CellItem
        cell.kCellWidth = 60
        cell.addSubviews(false)
        cell.imageView.image = UIImage(named: item.nameImages[indexPath.item]+".jpg")
        return cell
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        pushView(indexPath.item)
        
    }
}
