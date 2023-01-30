//
//  SecondViewModel.swift
//  MobNavigation
//
//  Created by Saurabh Dave on 1/28/23.
//

import UIKit

/// Class: SecondViewModel
/// The class is a subclass of BaseViewModel and is responsible for handling the logic of the second screen in the app.

/// Properties:
/// - coordinator: A weak reference to the AppCoordinator instance
/// - reversedFilePath: A string variable to store the reversed version of the file path
/// - filePath: A string variable to store the file path
/// - isLastScreen: A boolean variable indicating whether the current screen is the last screen
/// - data: A variable to store the data passed from previous screens

/// Method:
/// - goToNextScreen: A method to navigate to the next screen and pass the data.
/// If the current screen is the last screen, it ends the navigation flow. Otherwise, it passes the sourceLink as data to the next screen.

class SecondViewModel: BaseViewModel {
    
    // MARK: - Properties
    
    /// A weak reference to the AppCoordinator for navigation purpose
    weak var coordinator: AppCoordinator?
    
    /// A string property to store the reversed file path received from the previous screen
    var reversedFilePath = ""
    
    /// A string property to store the file path received from the previous screen
    var filePath = ""
    
    /// A boolean property to check if this is the last screen in the navigation flow
    var isLastScreen = false
    
    /// A property to store the data received from the previous screen
    var data: DataPassing? {
        didSet {
            guard let navigationData = data as? NavigationData else { return }
            filePath = navigationData.data ?? ""
            reversedFilePath = navigationData.reversedDataString ?? ""
        }
    }
    
    // MARK: - Methods
    
    /// A function to navigate to next screen
    ///
    /// - Parameter sourceLink: A string value to pass data to the next screen
    func goToNextScreen(sourceLink: String?) {
        if isLastScreen {
            coordinator?.end()
        } else {
            coordinator?.goToNextScreen(data: NavigationData(data: sourceLink))
        }
    }
}
