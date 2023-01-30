//
//  BaseViewModel.swift
//  MobNavigation
//
//  Created by Saurabh Dave on 1/28/23.
//

import Foundation

/// Protocol for base view model
/// All view models should inherit this protocol
protocol BaseViewModel {
    // Coordinator instance to handle navigation
    var coordinator: AppCoordinator? { get set }
    
    // Data to be passed to the next screen
    var data: DataPassing? { get set }
    
    // Method to call the coordinator to go to the next screen
    func goToNextScreen(sourceLink: String?)
}
