//
//  ThirdViewModelTest.swift
//  MobNavigationTests
//
//  Created by Saurabh Dave on 1/29/23.
//

import XCTest
@testable import MobNavigation

/// Test class for ThirdViewModel
final class ThirdViewModelTest: XCTestCase {
    
    // MARK: - Properties
    
    // sut - System Under Test, instance of ThirdViewModel
    var sut: ThirdViewModel!
    
    // coordinator - instance of AppCoordinatorMock
    var coordinator: AppCoordinatorMock!
    
    // MARK: - Override Methods

    // setUp method to initialize the objects before each test method
    override func setUp() {
        super.setUp()

        // Initialize sut
        sut = ThirdViewModel()
        
        // Initialize coordinator with UIWindow and NavigationControllerMock
        coordinator = AppCoordinatorMock(window: UIWindow(), navigationController: NavigationControllerMock())
        
        // Set coordinator to sut
        sut.coordinator = coordinator
    }
    
    // tearDown method to deallocate objects after each test method
    override func tearDown() {
        // Reset sut
        sut = nil
        
        // Reset coordinator
        coordinator = nil
        
        // Call super class's tearDown method
        super.tearDown()
    }
    
    // MARK: - Test Methods

    func testDataDidSet() {
        // Given
        let navigationData = NavigationData(data: "sample_file_path.jpg")
        
        // When
        sut.data = navigationData
        
        // Then
        XCTAssertEqual(sut.filePath, navigationData.data)
    }
    
    func testGoToNextScreen() {
        
        // Given
        let navigationData = NavigationData(data: "test_data")
        
        // When
        sut.data = navigationData
        sut.goToNextScreen(sourceLink: navigationData.reversedDataString)
        
        // Then
        XCTAssertTrue(coordinator.goToNextScreenCalled)
        XCTAssertEqual(sut.filePath, navigationData.data)
    }
    
    
    func testGoToNextScreenWithWrongSourceLink() {
        // Given
        let navigationData = NavigationData(data: "test_data")
        
        // When
        sut.data = navigationData
        sut.goToNextScreen(sourceLink: "wrong_source_link")
        
        // Then
        XCTAssertTrue(coordinator.goToNextScreenCalled)
        XCTAssertNotNil(coordinator.goToNextScreenData)
        XCTAssertNotEqual(sut.filePath, coordinator.goToNextScreenData?.data)
    }
    
    func testGoToNextScreen_LastScreen_EndsCoordinator() {
        
        coordinator.start()
        
        // Given
        sut.isLastScreen = true
        
        // When
        sut.goToNextScreen(sourceLink: nil)
        
        // Then
        XCTAssertTrue(coordinator.navigationController.count == 1)
    }
    
    func testGoToNextScreen_NotLastScreen_SendsDataToCoordinator() {
        // Given
        let sourceLink = "sample_file_path.jpg"
        
        // When
        sut.goToNextScreen(sourceLink: sourceLink)
        
        // Then
        XCTAssertTrue(coordinator.goToNextScreenCalled)
        XCTAssertEqual(coordinator.goToNextScreenData as? NavigationData, NavigationData(data: sourceLink))
    }
}
