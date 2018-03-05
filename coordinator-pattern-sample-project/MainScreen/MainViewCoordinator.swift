//
//  MainViewCoordinator.swift
//  coordinator-pattern-sample-project
//
//  Created by Malin Sundberg on 23/12/17.
//  Copyright © 2017 Malin Sundberg. All rights reserved.
//

import UIKit

class MainViewCoordinator: Coordinator {
    
    internal var navigationController: UINavigationController
    internal var childCoordinators: [Constants.CoordinatorKeys:Coordinator]
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.childCoordinators = [:]
        
        start()
    }
    
    internal func start() {
        let mainViewViewController = MainViewViewController(nibName: Constants.Nibs.mainViewViewController, bundle: Bundle.main, button1Action: navigateToSubFlow1, button2Action: navigateToSubFlow2)
        navigate(to: mainViewViewController, with: .push, animated: false)
    }
    
    private func navigateToSubFlow1() {
        let coordinator = SubFlow1Coordinator(with: navigationController, using: .push, removeCoordinatorWith: removeChild)
        addChild(coordinator: coordinator, with: .subView1Coordinator)
    }
    
    private func navigateToSubFlow2() {
        let coordinator = SubFlow2Coordinator(with: navigationController, using: .push, removeCoordinatorWith: removeChild)
        addChild(coordinator: coordinator, with: .subView2Coordinator)
    }

}
