import UIKit

extension UITableView {
    func dequeue<Cell: UITableViewCell>(_ cell: Cell.Type, for indexPath: IndexPath, identifier: String = NSStringFromClass(Cell.self)) -> Cell {
        // swiftlint:disable force_cast
        let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! Cell
        // swiftlint:enable force_cast
        return cell
    }
}
