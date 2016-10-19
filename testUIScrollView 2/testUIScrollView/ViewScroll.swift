//
//  ViewScroll.swift
//  ShopFashion
//
//  Created by anh  nguyen viet on 8/2/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class ViewScroll: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    var photo: [UIImageView] = []
    var pageImages: [String] = []
    var frontScrollViews: [UIScrollView] = []
    var first = false
    var currentPage = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        //pageImages = ["model1", "model2", "model3", "model4"]
        pageController.numberOfPages = pageImages.count
        pageController.currentPage = currentPage
        
    }
    override func viewDidLayoutSubviews() {
        if (!first)
        {
            first = true
            // 4
            let pagesScrollViewSize = scrollView.frame.size
            scrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * CGFloat(pageImages.count), 0)
            scrollView.contentOffset = CGPointMake(CGFloat(currentPage) * scrollView.frame.size.width, 0)
            // 5
            for (var i = 0; i < pageImages.count; i++)
            {
                let imgView = UIImageView(image: UIImage(named:pageImages[i]+".jpg"))
                imgView.frame = CGRectMake(0, 0, scrollView.frame.size.width, scrollView.frame.size.height)
                imgView.contentMode = .ScaleAspectFit
                imgView.userInteractionEnabled = true
                imgView.multipleTouchEnabled = true
                let tap = UITapGestureRecognizer(target: self, action: #selector(ViewScroll.tapImg(_:)))
                tap.numberOfTapsRequired = 1
                imgView.addGestureRecognizer(tap)
                let doubleTap = UITapGestureRecognizer(target: self, action: #selector(ViewScroll.doubleTabImg(_:)))
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
    
    func tapImg(gesture: UITapGestureRecognizer)
    {
        let position = gesture.locationInView(photo[pageController.currentPage])
        zoomRectForScale(frontScrollViews[pageController.currentPage].zoomScale * 1.5, center: position)
    }
    func doubleTabImg(gesture: UITapGestureRecognizer)
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
        
        zoomRect.origin.x = center.x - (zoomRect.size.width / 2.0)
        zoomRect.origin.y = center.y - (zoomRect.size.height / 2.0)
        frontScrollViews[pageController.currentPage] .zoomToRect(zoomRect, animated: true)
    }
    //uiscrollview delegate
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
    {
        return photo[pageController.currentPage]
    }
    
    @IBAction func onChange(sender: AnyObject) {
        scrollView.contentOffset = CGPointMake(CGFloat(pageController.currentPage) * scrollView.frame.size.width, 0)
    }
    
    
    @IBAction func backImage(sender: AnyObject) {
        var page = pageController.currentPage
        if (page > 0)
        {
            page = page - 1
            pageController.currentPage = page
            scrollView.contentOffset = CGPointMake(CGFloat(page) * scrollView.frame.size.width, 0)
        }
        
        else
        {
            print("ko the back")
        }
    }
    
    @IBAction func nextImage(sender: AnyObject) {
        let numberPage = pageImages.count
        
        var page = pageController.currentPage
        if (page < numberPage - 1)
        {
            page = page + 1
            pageController.currentPage = page
            scrollView.contentOffset = CGPointMake(CGFloat(page) * scrollView.frame.size.width, 0)
        }
        else
        {
            print("ko the next")
        }
    }
}
