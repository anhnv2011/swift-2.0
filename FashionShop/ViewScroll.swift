//
//  ViewScroll.swift
//  FashionShop
//
//  Created by anh  nguyen viet on 8/2/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class ViewScroll: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
 
    
    @IBOutlet weak var pageController: UIPageControl!
    var photo = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imgView = UIImageView(image: UIImage(named: "shop1-0.jpg"))
        imgView.frame = CGRectMake(0, 0, scrollView.frame.size.width , scrollView.frame.size.height)
        imgView.contentMode = .ScaleAspectFit
        
        imgView.userInteractionEnabled = true // de co the tuong tac giao dien voi no
        imgView.multipleTouchEnabled = true // de co the double tap
        
        let tap = UITapGestureRecognizer (target: self, action: Selector("tapImg:"))
        tap.numberOfTapsRequired = 1
        imgView.addGestureRecognizer(tap)
        
        let doubleTap = UITapGestureRecognizer (target: self, action: Selector("doubleTapImg:") )
        doubleTap.numberOfTapsRequired = 2
        imgView.addGestureRecognizer(doubleTap)
        
        tap.requireGestureRecognizerToFail(doubleTap) // chi nhan 1 lan tap khi khong an tap 2 lan
        
        
        
        //contentsize, bounces, contentoffset, contentInset, clipstobound
        scrollView.backgroundColor = UIColor.redColor()
        
        photo = imgView
        scrollView.contentSize = CGSizeMake(imgView.bounds.width + 20, imgView.bounds.height + 20)
        scrollView.bounces = true // hiện ảnh background khi di chuyển ảnh ra ngoài
        // scrollView.contentOffset = CGPointMake(-150, 0) // Di chuyển ảnh đến 1 điểm
        //scrollView.clipsToBounds = false // nếu content ra ngoài thì vẫn hiện phần ra ngoài hay ko
        //scrollView.contentInset = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
        
        self.scrollView.addSubview(imgView)
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 2
        
        
        
        
        
    }
    
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
    {
        return photo
    }
    
    func tapImg(gesture: UITapGestureRecognizer)
    {
        let position = gesture.locationInView(photo)
        zoomRectForScale(scrollView.zoomScale * 1.5, center: position)
    }
    
    func doubleTapImg(gesture: UITapGestureRecognizer)
    {
        let position = gesture.locationInView(photo)
        zoomRectForScale(scrollView.zoomScale * 0.5, center: position)

    }
    
    
    func zoomRectForScale(scale: CGFloat, center: CGPoint)
    
    {
        var zoomRect = CGRect()
        let scrollViewSize = scrollView.bounds.size
        zoomRect.size.height = scrollViewSize.height / scale
        zoomRect.size.width = scrollViewSize.width / scale
        
        
        zoomRect.origin.x = center.x - (zoomRect.size.width / 2)
        zoomRect.origin.y = center.y - (zoomRect.size.height / 2)
        
        print(zoomRect)
        scrollView.zoomToRect(zoomRect, animated: true)
    }
    var zoom : Float?
    
//
//    @IBAction func sld_zoom(sender: UISlider) {
//        zoom = sender.value
//        print(zoom)
//    }
//    
//    func setZoomScale()
//    {
//    }
    
}
