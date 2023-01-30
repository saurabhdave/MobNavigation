//
//  Constants.swift
//  MobNavigation
//
//  Created by Saurabh Dave on 1/29/23.
//

import Foundation

/// Enum to store all the string literals used in the application
public enum Strings {
    // Title for the First Screen
    static let firstScreenTitle = "Screen 1".localized
    // Title for the Second Screen
    static let secondScreenTitle = "Screen 2".localized
    // Title for the Third Screen
    static let thirdScreenTitle = "Screen 3".localized
    
    // Enum to store string literals specific to First Screen
    public enum FirstScreen {
        // Title for the Next Screen button
        static let nextScreenButtonTitle = "Next Screen".localized
        // Image name for the center image
        static let centerImageName = "character.png"
    }
}
