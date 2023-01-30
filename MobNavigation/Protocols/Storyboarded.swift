//
//  Storyboarded.swift
//  MobNavigation
//
//  Created by Saurabh Dave on 1/27/23.
//

import UIKit

/// Protocol for instantiating view controllers from storyboards.
protocol Storyboarded {
    static func instantiate() -> Self
}

/// Extension for UIViewController to conform to `Storyboarded` protocol.
/// The extension provides a default implementation for `instantiate()` method.
extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        // Get the full name of the view controller class in the format "MyApp.MyViewController"
        let fullName = NSStringFromClass(self)
        
        // Split the full name by "." and get the second part which is "MyViewController"
        let className = fullName.components(separatedBy: ".")[1]
        
        // Load the Main storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate a view controller with the specified identifier, which is the class name, and force cast it to the expected type
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
