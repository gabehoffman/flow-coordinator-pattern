//
//  AppFlowCoordinator.swift
//  FlowCoordinatorPattern
//
//  Created by Gabe Hoffman on 9/20/18.
//  Copyright © 2018 Big Nerd Ranch. All rights reserved.
//

import UIKit

class AppFlowCoordinatorDelegate: FlowCoordinatorDelegate {
    // The AppFlowCoordinator does not delegate to any other class
}

class AppFlowCoordinator: FlowCoordinator {
    typealias DelegateType = AppFlowCoordinatorDelegate
    var delegate: AppFlowCoordinatorDelegate?

    private(set) lazy var rootViewContoller: UIViewController = {
        guard let navController = ProjectStoryboard.main.instantiateInitialViewController() as? UINavigationController,
            let imageListViewController = navController.topViewController as? ImageListTableViewController else {
                preconditionFailure("rootViewController could not be created at this time.")
        }

        return navController
    }()

    private var rootNavigationController: UINavigationController {
        guard let rootNC = rootViewContoller as? UINavigationController else {
            preconditionFailure("rootNavigationController isn't a UINavigationController")
        }
        return rootNC
    }
}
