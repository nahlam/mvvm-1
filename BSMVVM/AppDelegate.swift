//
//  AppDelegate.swift
//  BSMVVM
//
//  Created by Nahla Mortada on 3/16/19.
//  Copyright © 2019 Nahla Mortada. All rights reserved.
//

import UIKit
import SwinjectStoryboard

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    static let mainAssembler = MainAssembler()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupWindow()
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
    }
    
}

private extension AppDelegate {
    
    // Initialize root view controller with SwinjectStoryboard, this is necessary for injecting UIViewControllers.
    func setupWindow() {
        let storyboard = AppDelegate.mainAssembler.resolver.resolve(SwinjectStoryboard.self)!
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        self.window = window
        window.backgroundColor = UIColor.black
        window.rootViewController = storyboard.instantiateInitialViewController()
    }
}
