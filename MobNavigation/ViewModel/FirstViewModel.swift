//
//  FirstViewModel.swift
//  MobNavigation
//
//  Created by Saurabh Dave on 1/28/23.
//

import Foundation
import Combine

/// Class: FirstViewModel
/// FirstViewModel is a subclass of BaseViewModel which is responsible for the first screen of the application.
class FirstViewModel: BaseViewModel {
    
    // MARK: - Properties
    
    // data is an instance of DataPassing protocol to pass data from one screen to another.
    var data: DataPassing?
    
    // coordinator is a weak reference to the AppCoordinator object, which handles the navigation between different screens.
    weak var coordinator: AppCoordinator?
    
    // navigationFlowDefault is a boolean variable that defines the default navigation flow between screens.
    // Default Flow: 1 --> 2 --> 3
    var navigationFlowDefault: Bool = true
    
    // MARK: - Methods
    
    /// A function to navigate to next screen
    ///
    /// - Parameter sourceLink: A string value to pass data to the next screen
    ///
    /// goToNextScreen is a function that triggers the navigation to the next screen.
    /// sourceLink is an optional string parameter, which is used as a source of data
    /// to be passed to the next screen.
    func goToNextScreen(sourceLink: String? = nil) {
        // Creating an instance of NavigationData with data from the application bundle.
        let data = NavigationData(data: Bundle.main.getStringPath(Strings.FirstScreen.centerImageName))
        
        // Triggering the navigation flow by sending navigationFlowDefault to toggleNavigationFlow.
        coordinator?.toggleNavigationFlow.send(navigationFlowDefault)
        
        // Calling goToNextScreen function from the coordinator object to navigate to the next screen.
        coordinator?.goToNextScreen(data: data)
    }
}
