//
//  BlueViewController.swift
//  FlowCoordinatorPattern
//
//  Created by Gabe Hoffman on 9/20/18.
//  Copyright © 2018 Big Nerd Ranch. All rights reserved.
//

import UIKit

protocol ColorViewControllerDelegate: FlowCoordinatorDelegate {
    func returnToHome()
    func madeNewColorSelection(cellType: ColorCellType)
}

class BlueViewController: UIViewController, StoryboardBootstrapping {
    static var storyboardName: ProjectStoryboard = .main
    static var storyboardIdentifier: String = "BlueViewController"

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
