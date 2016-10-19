//
//  AppDelegate.swift
//  SectionIndex
//
//  Created by anh  nguyen viet on 8/6/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let tableVC = TableViewController()
        tableVC.title = "Contact"
        
        let navi = UINavigationController(rootViewController: tableVC)
        
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: (UIFont.boldSystemFontOfSize(25))] /* Change title text color NavigationBar */
        
        UINavigationBar.appearance().barTintColor = UIColor.grayColor() /* Change background color Navigation Bar */
        
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent /* Change status bar color. Note: Set "View controller-based status bar appearance" to NO in your Info.plist */

        
        
        self.window?.rootViewController = navi
        self.window?.makeKeyAndVisible()  // ko chay thi man hinh se bi den, co tac dung nhu tich vao intital trong main.stotboard
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

