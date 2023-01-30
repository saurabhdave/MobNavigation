//
//  NavigationControllerMock.swift
//  MobNavigationTests
//
//  Created by Saurabh Dave on 1/29/23.
//

import UIKit

///
/// NavigationControllerMock is a mock class of UINavigationController.
/// It's used to test the behavior of the UINavigationController class.

/// The 'pushedViewController' property is used to store the view controller that was pushed by the pushViewController method.

/// The 'pushViewController' method is overridden to store the view controller being pushed and calling the super class's pushViewController method.

/// Note that the 'animated' parameter is set to false for all calls to pushViewController, regardless of its original value, as it's not relevant to the tests.
class NavigationControllerMock: UINavigationController {
    
    var pushedViewController: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushedViewController = viewController
        super.pushViewController(viewController, animated: false)
    }
}
