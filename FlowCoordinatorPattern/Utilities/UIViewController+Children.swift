//
//  UIViewController+Children.swift
//  FlowCoordinatorPattern
//
//  Created by Gabe Hoffman on 9/20/18.
//  Copyright © 2018 Big Nerd Ranch. All rights reserved.
//

import UIKit

extension UIViewController {
    func add(_ child: UIViewController, constraints: [NSLayoutConstraint] = []) {
        willMove(toParent: self)
        addChild(child)
        view.addSubview(child.view)
        if constraints.count > 0 {
            child.view.translatesAutoresizingMaskIntoConstraints = false
        }
        for constraint in constraints {
            constraint.isActive = true
        }
        child.didMove(toParent: self)
    }
    
    func remove() {
        guard parent != nil else {
            return
        }
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
}
