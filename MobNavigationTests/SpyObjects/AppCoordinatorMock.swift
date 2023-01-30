//
//  AppCoordinatorMock.swift
//  MobNavigationTests
//
//  Created by Saurabh Dave on 1/29/23.
//

import Foundation
@testable import MobNavigation

/// The AppCoordinatorMock class is a subclass of the AppCoordinator class. It is used for testing purposes, specifically to mock the behavior of the goToNextScreen method.

/// Properties:
/// 1. goToNextScreenCalled: A boolean value to keep track of whether the goToNextScreen method has been called.
/// 2. goToNextScreenData: A property to store the data passed to the goToNextScreen method.

/// The goToNextScreen method has been overridden in this class to only set the goToNextScreenCalled property to true and store the data passed to the method in goToNextScreenData. This is done to ensure that the method has been called and to store the data passed to the method, without actually performing any navigation.
class AppCoordinatorMock: AppCoordinator {
    
    var goToNextScreenCalled = false
    var goToNextScreenData: DataPassing?
    
    override func goToNextScreen(data: any DataPassing) {
        goToNextScreenCalled = true
        self.goToNextScreenData = data
    }
}
