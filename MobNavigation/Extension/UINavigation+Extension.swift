//
//  UINavigation+Extension.swift
//  MobNavigation
//
//  Created by Saurabh Dave on 1/28/23.
//

import Foundation
import UIKit

/// Extension to `UINavigationController` that adds utility methods.
public extension UINavigationController {
    
    /// Removes any instances of a given `UIViewController` subclass from the viewControllers array.
    /// - Parameter kind: The class of the view controllers to remove.
    func removeAnyViewControllers(ofKind kind: AnyClass) {
        self.viewControllers = self.viewControllers.filter { !$0.isKind(of: kind)}
    }
    
    /// Returns a Boolean value indicating whether the viewControllers array contains at least one instance of the given `UIViewController` subclass.
    /// - Parameter kind: The class of the view controllers to check for.
    /// - Returns: `true` if there is at least one instance of the class in the viewControllers array, `false` otherwise.
    func containsViewController(ofKind kind: AnyClass) -> Bool {
        return self.viewControllers.contains(where: { $0.isKind(of: kind) })
    }
    
    /// Retrieves the view controller at a given index in the viewControllers array.
    /// - Parameter index: The index of the view controller to retrieve.
    /// - Returns: The view controller at the given index, or `nil` if the index is out of bounds.
    func viewController(atIndex index: Int) -> UIViewController? {
        return self.viewControllers.count > index ? self.viewControllers[index] : nil
    }
    
    /// The first view controller in the viewControllers array.
    var first: UIViewController? {
        return self.viewControllers.first
    }
    
    /// The last view controller in the viewControllers array.
    var last: UIViewController? {
        return self.viewControllers.last
    }
    
    /// The number of view controllers in the viewControllers array.
    var count: Int {
        return self.viewControllers.count
    }
}
