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
        // Initialization code
    }

    func configure(_ row: ListRow) {
        switch row {
        case .blue:
            backgroundColor = .blue
        case .orange:
            backgroundColor = .orange
        case .red:
            backgroundColor = .red
        case .yellow:
            backgroundColor = .yellow
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
