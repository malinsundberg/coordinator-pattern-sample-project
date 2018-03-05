//
//  SubFlow1Coordinator.swift
//  coordinator-pattern-sample-project
//
//  Created by Malin Sundberg on 23/12/17.
//  Copyright © 2017 Malin Sundberg. All rights reserved.
//

import UIKit

class SubFlow1Coordinator: NSObject, Coordinator {
    internal var navigationController: UINavigationController
    internal var childCoordinators: [Constants.CoordinatorKeys:Coordinator]
    
    private var preferredNavigationStyle: navigationStyle
    private var removeCoordinatorWhenViewDismissed: ((Coordinator) -> ())
    
    init(with navigationController: UINavigationController, using preferredNavigationStyle: navigationStyle, removeCoordinatorWith removeCoordinatorWhenViewDismissed: @escaping ((Coordinator) -> ())) {
        self.navigationController = navigationController
        self.childCoordinators = [:]
        self.preferredNavigationStyle = preferredNavigationStyle
        self.removeCoordinatorWhenViewDismissed = removeCoordinatorWhenViewDismissed
        
        super.init()
        
        navigationController.delegate = self
        start()
    }
    
    internal func start() {
        let subView1TableViewController = SubView1TableViewController(nibName: Constants.Nibs.subView1TableViewController, bundle: Bundle.main, withAction: navigationWhenTapped)
        navigate(to: subView1TableViewController, with: preferredNavigationStyle)
    }

    private func navigationWhenTapped(cellWith title: String) {
        let detailViewController = DetailViewController(nibName: Constants.Nibs.detailViewController, bundle: Bundle.main, with: title)
        navigate(to: detailViewController, with: preferredNavigationStyle)
    }

}

extension SubFlow1Coordinator: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let viewController = navigationController.transitionCoordinator?.viewController(forKey: .from), !navigationController.viewControllers.contains(viewController) else {
                return
        }
        
        if viewController is SubView1TableViewController {
            removeCoordinatorWhenViewDismissed(self)
        }
    }
    
}
