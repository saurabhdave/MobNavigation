//
//  SecondViewModelTest.swift
//  MobNavigationTests
//
//  Created by Saurabh Dave on 1/29/23.
//

import XCTest
@testable import MobNavigation

/// Test class for SecondViewModel
final class SecondViewModelTest: XCTestCase {
    
    // MARK: - Properties
    
    /// System Under Test (sut)
    var sut: SecondViewModel!
    
    /// Coordinator mock object
    var coordinator: AppCoordinatorMock!
    
    // MARK: - Override Methods
    
    override func setUp() {
        super.setUp()
        
        // Setup sut object
        sut = SecondViewModel()
        
        // Setup coordinator mock object
        coordinator = AppCoordinatorMock(window: UIWindow(), navigationController: NavigationControllerMock())
        sut.coordinator = coordinator
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
    
    func testDataDidSet() {
        // Given
        let navigationData = NavigationData(data: "test_file_path.jpg")
        
        // When
        sut.data = navigationData
        
        // Then
        XCTAssertEqual(sut.filePath, navigationData.data)
        XCTAssertEqual(sut.reversedFilePath, navigationData.reversedDataString)
    }
    
    func testGoToNextScreen() {
        // Given
        let navigationData = NavigationData(data: "test_data")
        sut.data = navigationData
        
        // When
        sut.goToNextScreen(sourceLink: navigationData.reversedDataString)
        
        // Then
        XCTAssertTrue(coordinator.goToNextScreenCalled)
        XCTAssertEqual(sut.filePath, navigationData.data)
        XCTAssertEqual(sut.reversedFilePath, navigationData.reversedDataString)
    }
    
    func testGoToNextScreenWithWrongSourceLink() {
        // Given
        let navigationData = NavigationData(data: "test_data")
        sut.data = navigationData
        
        // When
        sut.goToNextScreen(sourceLink: "wrong_source_link")
        
        // Then
        XCTAssertTrue(coordinator.goToNextScreenCalled)
        XCTAssertNotNil(coordinator.goToNextScreenData)
        XCTAssertNotEqual(sut.filePath, coordinator.goToNextScreenData?.data)
    }
    
    func testGoToNextScreen_LastScreen_EndsCoordinator() {
        // Given
        coordinator.start()
        sut.isLastScreen = true
        
        // When
        sut.goToNextScreen(sourceLink: nil)
        
        // Then
        XCTAssertTrue(coordinator.navigationController.count == 1)
    }
    
    func testGoToNextScreen_NotLastScreen_SendsDataToCoordinator() {
        // Given
        let sourceLink = "character.png"
        
        // When
        sut.goToNextScreen(sourceLink: sourceLink)
        
        // Then
        XCTAssertTrue(coordinator.goToNextScreenCalled)
        XCTAssertEqual(coordinator.goToNextScreenData as? NavigationData, NavigationData(data: sourceLink))
    }
}
