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

enum ApplicationState {
    case home, red, yellow, blue, orange
}

class AppFlowCoordinator: FlowCoordinator {
    typealias DelegateType = AppFlowCoordinatorDelegate
    var delegate: AppFlowCoordinatorDelegate?

    private var homeViewController: ImageListTableViewController {
        return ImageListTableViewController.instantiateFromStoryboard()
    }
    private var redViewController: RedViewController {
        return RedViewController.instantiateFromStoryboard()
    }
    private var blueViewController: BlueViewController {
        return BlueViewController.instantiateFromStoryboard()
    }
    private var yellowViewController: YellowViewController {
        return YellowViewController.instantiateFromStoryboard()
    }

    private(set) lazy var rootViewContoller: UIViewController = {
        guard let navController = ProjectStoryboard.main.instantiateInitialViewController() as? UINavigationController,
            let imageListViewController = navController.topViewController as? ImageListTableViewController else {
                preconditionFailure("rootViewController could not be created at this time.")
        }
        imageListViewController.configure(delegate: self)
        return navController
    }()

    private var rootNavigationController: UINavigationController {
        guard let rootNC = rootViewContoller as? UINavigationController else {
            preconditionFailure("rootNavigationController isn't a UINavigationController")
        }
        return rootNC
    }

    func enterState(appState: ApplicationState) {
        switch appState {
        case .home:

            print("State: \(appState)")
        case .red:

            print("State: \(appState)")
        case .yellow:

            print("State: \(appState)")
        case .blue:

            print("State: \(appState)")
        case .orange:

            print("State: \(appState)")
        }
    }
}

extension AppFlowCoordinator: ImageListTableViewControllerDelegate {
    func madeImageSelection(colorType: ColorCellType) {
        switch colorType {
        case .red:
            enterState(appState: .red)
        case .yellow:
            enterState(appState: .yellow)
        case .blue:
            enterState(appState: .blue)
        case .orange:
            enterState(appState: .orange)
        }
    }
}

extension AppFlowCoordinator: ColorViewControllerDelegate {
    func returnToHome() {
        enterState(appState: .home)
    }

    func madeNewColorSelection(cellType: ColorCellType) {
        switch cellType {
        case .red:
            enterState(appState: .red)
        case .yellow:
            enterState(appState: .yellow)
        case .blue:
            enterState(appState: .blue)
        case .orange:
            enterState(appState: .orange)
        }
    }
}
