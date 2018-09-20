//
//  OrangeViewController.swift
//  FlowCoordinatorPattern
//
//  Created by Gabe Hoffman on 9/20/18.
//  Copyright © 2018 Big Nerd Ranch. All rights reserved.
//

import UIKit

class OrangeViewController: UIViewController, StoryboardBootstrapping {
    static var storyboardName: ProjectStoryboard = .main
    static var storyboardIdentifier: String = "OrangeViewController"

    weak var delegate: ColorViewControllerDelegate?

    func configure(delegate: ColorViewControllerDelegate) {
        self.delegate = delegate
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let delegate = delegate else {
            return
        }
        let yellowVC = YellowViewController.instantiateFromStoryboard()
        yellowVC.configure(delegate: delegate)
        yellowVC.willMove(toParent: self)
        add(yellowVC, constraints: [
        yellowVC.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        yellowVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        yellowVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        yellowVC.view.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)])

        let redVC = RedViewController.instantiateFromStoryboard()
        redVC.configure(delegate: delegate)
        redVC.willMove(toParent: self)
        add(redVC, constraints: [
        redVC.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        redVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        redVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        redVC.view.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)])
    }

}
