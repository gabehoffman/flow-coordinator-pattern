//
//  RedViewController.swift
//  FlowCoordinatorPattern
//
//  Created by Gabe Hoffman on 9/20/18.
//  Copyright © 2018 Big Nerd Ranch. All rights reserved.
//

import UIKit

class RedViewController: UIViewController, StoryboardBootstrapping {
    static var storyboardName: ProjectStoryboard = .main
    static var storyboardIdentifier: String = "RedViewController"

    weak var delegate: ColorViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func configure(delegate: ColorViewControllerDelegate) {
        self.delegate = delegate
    }

    @IBAction func homeButtonTapped(_ sender: Any) {
        delegate?.returnToHome()
    }

    @IBAction func blueButtonTapped(_ sender: Any) {
        delegate?.madeNewColorSelection(cellType: .blue)
    }

    @IBAction func redButtonTapped(_ sender: Any) {
        delegate?.madeNewColorSelection(cellType: .red)
    }

    @IBAction func orangeButtonTapped(_ sender: Any) {
        delegate?.madeNewColorSelection(cellType: .orange)
    }
}

