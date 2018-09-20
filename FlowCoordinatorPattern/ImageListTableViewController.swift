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
            return "ColorCell"
        }
    }
}

class ImageListTableViewController: UITableViewController, StoryboardBootstrapping {
    static var storyboardName: ProjectStoryboard = .main
    static var storyboardIdentifier: String = "ImageListTableViewController"

    var sections: [ListSection] = [.colors([.red, .yellow, .blue, .orange])]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rowCount
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if case let ListSection.colors(colorRows) = sections[indexPath.section]{
            let row =  colorRows[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: row.reuseIdentifier, for: indexPath) as! ColorViewCell
            cell.configure(row)
            return cell
        }
        // something went wrong
        return UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
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
