//
//  AppCoordinator.swift
//  coordinator-pattern-sample-project
//
//  Created by Malin Sundberg on 22/12/17.
//  Copyright © 2017 Malin Sundberg. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    private var window: UIWindow
    internal var childCoordinators: [Constants.CoordinatorKeys:Coordinator]
    internal var navigationController: UINavigationController
    
    public var rootViewController: UIViewController {
        return navigationController
    }
    
    init(in window: UIWindow) {
        self.childCoordinators = [:]
        self.navigationController = UINavigationController()
        self.window = window
        self.window.backgroundColor = .white
        self.window.rootViewController = rootViewController
        self.window.makeKeyAndVisible()
    }
    
    public func start() {
        let mainViewCoordinator = MainViewCoordinator(with: navigationController)
        addChild(coordinator: mainViewCoordinator, with: .mainViewCoordinator)
    }
}
