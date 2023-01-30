//
//  ThirdViewModel.swift
//  MobNavigation
//
//  Created by Saurabh Dave on 1/28/23.
//

import Foundation

/// Class: ThirdViewModel
/// ThirdViewModel is a subclass of BaseViewModel and responsible for handling the logic and data for the Third screen of the app.

class ThirdViewModel: BaseViewModel {
    
    // MARK: - Properties
    
    /// A weak reference to the coordinator object which manages navigation flow.
    weak var coordinator: AppCoordinator?
    
    /// A string property to store the file path.
    var filePath = ""
    
    /// A boolean property to store whether this is the last screen of the app.
    var isLastScreen = false
    
    /// A property to store the data passed from the previous screen.
    var data: DataPassing? {
        didSet {
            // Check if the data passed is of type NavigationData and update the filePath property.
            if let navigationData = data as? NavigationData {
                filePath = navigationData.data ?? ""
            }
        }
    }
    
    
    // MARK: - Methods
    
    /// A function to navigate to the next screen.
    /// - Parameter sourceLink: A string representing the source link of the next screen.
    func goToNextScreen(sourceLink: String?) {
        // Check if this is the last screen.
        if isLastScreen {
            // End the navigation flow.
            coordinator?.end()
        } else {
            // Go to the next screen with the NavigationData object.
            coordinator?.goToNextScreen(data: NavigationData(data: sourceLink))
        }
    }
}
