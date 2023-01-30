//
//  FirstViewModelTest.swift
//  MobNavigationTests
//
//  Created by Saurabh Dave on 1/29/23.
//

import XCTest
@testable import MobNavigation

/// Test class for FirstViewModel
final class FirstViewModelTest: XCTestCase {
    
    // MARK: - Properties
    
    /// System Under Test (sut)
    var sut: FirstViewModel!
    
    /// Coordinator mock object
    var coordinator: AppCoordinatorMock!
    
    // MARK: - Override Methods
    override func setUp() {
        super.setUp()
        // Setup sut object
        sut = FirstViewModel()
        
        // Setup coordinator mock object
        coordinator = AppCoordinatorMock(window: UIWindow(), navigationController: NavigationControllerMock())
    }
    
    override func tearDown() {
        // Release sut object
        sut = nil
        
        // Release coordinator mock object
        coordinator = nil
        
        // Call the super class tearDown method
        super.tearDown()
    }
    
    // MARK: - Test Methods
    
    func testGoToDefaultNextScreen() {
        // Given
        sut.coordinator = coordinator
        sut.navigationFlowDefault = true
        
        // When
        sut.goToNextScreen()
        
        // Then
        XCTAssertTrue(coordinator.toggleNavigationFlow.value)
        XCTAssertTrue(coordinator.goToNextScreenCalled)
        XCTAssertNotNil(coordinator.goToNextScreenData)
    }
    
    func testGoToNonDefaultNextScreen() {
        // Given
        sut.coordinator = coordinator
        sut.navigationFlowDefault = false
        
        // When
        sut.goToNextScreen()
        
        // Then
        XCTAssertFalse(coordinator.toggleNavigationFlow.value)
        XCTAssertTrue(coordinator.goToNextScreenCalled)
        XCTAssertNotNil(coordinator.goToNextScreenData)
    }
    
    func testGoToNextScreenWithSourceLink() {
        // Given
        sut.coordinator = coordinator
        sut.navigationFlowDefault = true
        let sourceLink = "https://www.example.com"
        
        // When
        sut.goToNextScreen(sourceLink: sourceLink)
        
        // Then
        XCTAssertTrue(coordinator.toggleNavigationFlow.value)
        XCTAssertTrue(coordinator.goToNextScreenCalled)
        XCTAssertNotNil(coordinator.goToNextScreenData)
    }
}
