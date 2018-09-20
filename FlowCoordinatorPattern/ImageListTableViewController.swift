//
//  ImageListTableViewController.swift
//  FlowCoordinatorPattern
//
//  Created by Gabe Hoffman on 9/20/18.
//  Copyright © 2018 Big Nerd Ranch. All rights reserved.
//

import UIKit

enum ListSection {
    case colors([ListRow])

    var header: String? {
        switch self {
        case .colors: return NSLocalizedString("Color Selection", comment: "Color selection")
        }
    }

    var footer: String? {
        switch self {
        case .colors: return NSLocalizedString("You should really pick a color", comment: "off color comment")
        }
    }

    var rowCount: Int {
        switch self {
        case .colors(let rows): return rows.count
        }
    }
}

enum ListRow {
    case red
    case yellow
    case blue
    case orange

    var reuseIdentifier: String {
        switch self {
        default:
            return "ColorViewCell"
        }
    }
}

protocol ImageListTableViewControllerDelegate: FlowCoordinatorDelegate {
    func madeImageSelection(colorType: ColorCellType)
}


class ImageListTableViewController: UITableViewController, StoryboardBootstrapping {
    static var storyboardName: ProjectStoryboard = .main
    static var storyboardIdentifier: String = "ImageListTableViewController"

    var sections: [ListSection] = [.colors([.red, .yellow, .blue, .orange])]
    weak var delegate: ImageListTableViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    func configure(delegate: ImageListTableViewControllerDelegate) {
        self.delegate = delegate
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rowCount
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if case let ListSection.colors(rowsInSection) = sections[indexPath.section]{
            let row =  rowsInSection[indexPath.row]
            let cell = tableView.dequeue(ColorViewCell.self, for: indexPath)
            cell.configure(row)
            return cell
        }
        // something went wrong
        return UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if case let ListSection.colors(rowsInSection) = sections[indexPath.section]{
            let row =  rowsInSection[indexPath.row]
            switch row {
            case .red:
                delegate?.madeImageSelection(colorType: .red)
            case .yellow:
                delegate?.madeImageSelection(colorType: .yellow)
            case .blue:
                delegate?.madeImageSelection(colorType: .blue)
            case .orange:
                delegate?.madeImageSelection(colorType: .orange)
            }
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

}
