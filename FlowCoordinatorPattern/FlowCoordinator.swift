//
//  FlowCoordinator.swift
//
//  To enforce conformance of all objects to the FlowCoordinator pattern.
//    See: https://davedelong.com/blog/2018/04/24/a-better-mvc-part-5-an-evolution/
//    See: https://www.hackingwithswift.com/articles/71/how-to-use-the-coordinator-pattern-in-ios-apps
//    See: http://khanlou.com/2015/01/the-coordinator/
//    See: http://khanlou.com/2015/10/coordinators-redux/
//    See: http://khanlou.com/tag/advanced-coordinators/
//    TLDR: ViewControllers are actually views (or collections of views), FlowCoordinators are the controllers in MVC pattern,
//      think of the Flow Coordinator as a programmatic storyboard.

import UIKit

protocol FlowCoordinatorDelegate: class {
    /**
    - There are no required methods, just that this is the documented convention.

    - This protocol explicitly states the outgoing actions this Flow Coordinator will use to notify a conforming class.
      So that we know who is being notified (i.e. WHO wants to know WHAT happened?)

    - Subclassing this protocol allows others to conform to the class requirements so the delegates can be weakly held
      and explictly states and documents the pattern to be used.

    - example methods could be:
      func logoutRequested()
      func aThingWasSelected(some: Thing)
    **/
}

protocol FlowCoordinator {
    associatedtype DelegateType
    /**
     - Flow Coordinators - FCs delegate actions that span multiple ViewControllers together.
       (These look a little like the P in VIPER, Presenters).

     - If you want to get from one VC to another, that call gets delegated from the VC to the FC, which reports it semantically
       (view method would be "button pressed", FC method is "logout requested").
       The Flow Coordinator receives that, and adjusts the VC hierarchy appropriately.

     - This pattern allows multiple conveniences like deep linking, animated transitions through multiple VCs,
       separating business logic from UIKit specific logic,
       and cleaner/simpler dependency injection without needing Service Locators or other patterns.

     - Coordinators can create other coordinators. Each coordinator should match a logical "flow" as the Product Designers lay them out.
     **/

    /** The current root view **/
    var rootViewContoller: UIViewController { get }

    /** see above protocol FlowDelegate for reference
     this will be subclassed for each individual instance **/
    var delegate: DelegateType? { get set }
}
