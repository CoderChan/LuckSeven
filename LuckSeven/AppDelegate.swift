//
//  AppDelegate.swift
//  LuckSeven
//
//  Created by Chan_Sir on 2019/12/22.
//  Copyright © 2019 LuckSeven. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.setupKeyWindow()
        return true
    }
    
    func setupKeyWindow() -> Void {
        let root: SuperViewController = SuperViewController()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = .gray
        self.window?.rootViewController = root
        self.window?.makeKeyAndVisible()
        
    }

}

