//
//  AppDelegate.swift
//  Draw
//
//  Created by Julian Grosshauser on 18/01/16.
//  Copyright © 2016 Julian Grosshauser. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    //MARK: Properties

    var window: UIWindow? = {
        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window.backgroundColor = .whiteColor()
        return window
    }()

    //MARK: UIApplicationDelegate

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let controllers = [DrawController()]
        let tableController = TableController(controllers: controllers)
        window?.rootViewController = UINavigationController(rootViewController: tableController)
        window?.makeKeyAndVisible()
        return true
    }
}

