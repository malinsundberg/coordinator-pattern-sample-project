//
//  CoordinatorProtocol.swift
//  coordinator-pattern-sample-project
//
//  Created by Malin Sundberg on 22/12/17.
//  Copyright © 2017 Malin Sundberg. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    var navigationController: UINavigationController { get }
    var childCoordinators: [Constants.CoordinatorKeys:Coordinator] { get set }
    
    func start()
    func addChild(coordinator: Coordinator, with key: Constants.CoordinatorKeys)
    func removeChild(coordinator: Coordinator)
}

extension Coordinator {
    
    func addChild(coordinator: Coordinator, with key: Constants.CoordinatorKeys) {
        childCoordinators[key] = coordinator
    }
    
    func removeChild(coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0.value !== coordinator }
    }
    
}

extension Coordinator {
    
    func navigate(to viewController: UIViewController, with presentationStyle: navigationStyle, animated: Bool = true) {
        switch presentationStyle {
        case .present:
            navigationController.present(viewController, animated: animated, completion: nil)
        case .push:
            navigationController.pushViewController(viewController, animated: true)
        }
    }
    
}

enum navigationStyle {
    case present
    case push
}

