//
//  ColorViewCell.swift
//  FlowCoordinatorPattern
//
//  Created by Gabe Hoffman on 9/20/18.
//  Copyright © 2018 Big Nerd Ranch. All rights reserved.
//

import UIKit

enum ColorCellTypes {
    case red, yellow, blue, orange
}

class ColorViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(_ row: ListRow) {
        switch row {
        case .blue:
            backgroundColor = .blue
            self.textLabel?.text = "BLUE"
            self.textLabel?.textColor = .white
        case .orange:
            backgroundColor = .orange
            self.textLabel?.text = "ORANGE"
            self.textLabel?.textColor = .white
        case .red:
            backgroundColor = .red
            self.textLabel?.text = "RED"
            self.textLabel?.textColor = .white
        case .yellow:
            backgroundColor = .yellow
            self.textLabel?.text = "YELLOW"
            self.textLabel?.textColor = .black
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
