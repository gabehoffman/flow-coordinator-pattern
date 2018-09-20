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
        let vc = ImageListTableViewController.instantiateFromStoryboard()
        vc.configure(delegate: self)
        return vc
    }
    private var redViewController: RedViewController {
        let vc = RedViewController.instantiateFromStoryboard()
        vc.configure(delegate: self)
        return vc
    }
    private var blueViewController: BlueViewController {
        let vc = BlueViewController.instantiateFromStoryboard()
        vc.configure(delegate: self)
        return vc
    }
    private var yellowViewController: YellowViewController {
        let vc = YellowViewController.instantiateFromStoryboard()
        vc.configure(delegate: self)
        return vc
    }
    private var orangeViewController: OrangeViewController {
        let vc = OrangeViewController.instantiateFromStoryboard()
        vc.configure(delegate: self)
        return vc
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
        print("Entering State: \(appState)")
        switch appState {
        case .home:
            rootViewContoller.show(homeViewController, sender: nil)
        case .red:
            rootViewContoller.show(redViewController, sender: nil)
        case .yellow:
            rootViewContoller.show(yellowViewController, sender: nil)
        case .blue:
            rootViewContoller.show(blueViewController, sender: nil)
        case .orange:
            rootViewContoller.show(orangeViewController, sender: nil)
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
