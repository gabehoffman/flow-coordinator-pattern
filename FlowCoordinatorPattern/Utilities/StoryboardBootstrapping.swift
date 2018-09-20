import UIKit

/**
 Simplifies instantiating a storyboard-vended VC.

 You set the name and identifier, and it gives you a default `instantiateFromStoryboard()`.
 */

enum ProjectStoryboard: String {
    case main = "Main"

    func instantiateInitialViewController() -> UIViewController {
        return UIStoryboard(name: self.rawValue, bundle: nil).instantiateInitialViewController()!
    }
}

protocol StoryboardBootstrapping: class {
    /// The name of the storyboard containing the VC's view.
    static var storyboardName: ProjectStoryboard { get }

    /// The identifier in `storyboardName` corresponding to the VC.
    static var storyboardIdentifier: String { get }

    /// The default implementation should suffice, unless you need to set the bundle.
    static func instantiateFromStoryboard() -> Self
}

extension StoryboardBootstrapping where Self: UIViewController {
    static func instantiateFromStoryboard() -> Self {
        return UIStoryboard(name: storyboardName.rawValue, bundle: nil)
            .instantiateViewController(withIdentifier: storyboardIdentifier)
            as! Self  // swiftlint:disable:this force_cast
    }
}
