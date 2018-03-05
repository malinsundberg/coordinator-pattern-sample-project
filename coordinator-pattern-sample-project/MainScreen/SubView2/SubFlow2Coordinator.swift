//
//  SubFlow2Coordinator.swift
//  coordinator-pattern-sample-project
//
//  Created by Malin Sundberg on 25/12/17.
//  Copyright © 2017 Malin Sundberg. All rights reserved.
//

import UIKit

class SubFlow2Coordinator: NSObject, Coordinator {
    
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
        let title = "SubView2"
        let subTitle = "Tap the button below to see a static UITableView"
        let subView2ViewController = SubView2ViewController(nibName: Constants.Nibs.subView2ViewController, bundle: Bundle.main, withText: title, and: subTitle, withAction: navigationWhenTappedButton, and: navigationWhenTappedDismissButton)
        
        navigate(to: subView2ViewController, with: preferredNavigationStyle)
    }
    
    private func navigationWhenTappedButton() {
        
        let storyboard = UIStoryboard(name: Constants.Storyboards.detailTableView, bundle: nil)
        let detailTableViewController = storyboard.instantiateViewController(withIdentifier: Constants.Storyboards.StoryboardIdentifiers.detailTableView) as! DetailTableViewController
        
        navigate(to: detailTableViewController, with: preferredNavigationStyle)
    }
    
    private func navigationWhenTappedDismissButton() {
        navigationController.dismiss(animated: true, completion: nil)
    }
    
}

extension SubFlow2Coordinator: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let viewController = navigationController.transitionCoordinator?.viewController(forKey: .from), !navigationController.viewControllers.contains(viewController) else {
            return
        }
        
        if viewController is SubView2ViewController {
            removeCoordinatorWhenViewDismissed(self)
        }
    }
    
}
