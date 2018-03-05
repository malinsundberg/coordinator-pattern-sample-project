//
//  AppDelegate.swift
//  coordinator-pattern-sample-project
//
//  Created by Malin Sundberg on 10/12/17.
//  Copyright © 2017 Malin Sundberg. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private lazy var appCoordinator: AppCoordinator = {
        return AppCoordinator(in: self.window!)
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        appCoordinator.start()
        
        return true
    }

}

