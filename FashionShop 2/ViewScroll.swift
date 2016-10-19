//
//  ViewScroll.swift
//  FashionShop
//
//  Created by anh  nguyen viet on 8/2/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class ViewScroll: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageController: UIPageControl!
    
    var photo : [UIImageView] = []
    var pageImages : [String] = []
    var frontScrollViews : [UIScrollView] = []
    var first = false
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        pageImages = ["model1.jpg", "model2.jpg", "model3.jpg", "model4.jpg"]
        pageController.currentPage = 0
        pageController.numberOfPages = pageImages.count

        self.scrollView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        
        if (!first)
        {
        let pagesScrollViewSize = scrollView.frame.size
        scrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * CGFloat(pageImages.count), 0) // height = 0 de chi co ther di chuyen ngang
        scrollView.contentOffset = CGPointMake(CGFloat(currentPage) * scrollView.frame.size.width , 0)
        
        for (var i = 0; i < pageImages.count; i++)
        {
            
            let imgView = UIImageView(image: UIImage(named:pageImages[i]+".jpg"))
            imgView.frame = CGRectMake(0, 0, scrollView.frame.size.width, scrollView.frame.size.height)
            imgView.contentMode = .ScaleAspectFit
            imgView.userInteractionEnabled = true
            imgView.multipleTouchEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: Selector("tapImg:"))
            tap.numberOfTapsRequired = 1
            imgView.addGestureRecognizer(tap)
            let doubleTap = UITapGestureRecognizer(target: self, action: Selector("doubleTabImg:"))
            doubleTap.numberOfTapsRequired = 2
            imgView.addGestureRecognizer(doubleTap)
            tap.requireGestureRecognizerToFail(doubleTap)
            photo.append(imgView)
            let frontScrollView = UIScrollView(frame: CGRectMake( CGFloat(i) * scrollView.frame.size.width, 0, scrollView.frame.size.width, scrollView.frame.size.height))
            frontScrollView.minimumZoomScale = 1
            frontScrollView.maximumZoomScale = 2
            frontScrollView.delegate = self
            frontScrollView.contentSize = imgView.bounds.size
            frontScrollView.addSubview(imgView)
            frontScrollViews.append(frontScrollView)
            self.scrollView.addSubview(frontScrollView)

        }

        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView)
    {
        print(scrollView.contentOffset)
        var pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageController.currentPage = Int(pageNumber)
    }
    
    @IBAction func onChange(sender: AnyObject) {
        
        scrollView.contentOffset = CGPointMake(CGFloat(pageController.currentPage) * scrollView.frame.size.width, 0)
    }

    
    
    
    
    
    
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
    {
        return photo[pageController.currentPage]
    }
    
    func tapImg(gesture: UITapGestureRecognizer)
    {
        let position = gesture.locationInView(photo[pageController.currentPage])
        zoomRectForScale(frontScrollViews[pageController.currentPage].zoomScale * 1.5, center: position)
    }
    
    func doubleTapImg(gesture: UITapGestureRecognizer)
    {
        let position = gesture.locationInView(photo[pageController.currentPage])
        zoomRectForScale(frontScrollViews[pageController.currentPage].zoomScale * 0.5, center: position)

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
        frontScrollViews[pageController.currentPage].zoomToRect(zoomRect, animated: true)
    }
    
    
    
//    var zoom : Float?
//    
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
