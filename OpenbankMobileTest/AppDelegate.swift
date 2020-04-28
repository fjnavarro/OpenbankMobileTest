//
//  AppDelegate.swift
//  OpenbankMobileTest
//
//  Created by Francisco José Navarro García on 28/04/2020.
//  Copyright © 2020 AtalayaSoft OÜ. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let homeView = HomeWireFrame.createHomeModule()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = homeView
        window?.makeKeyAndVisible()
        
        return true
    }


}

