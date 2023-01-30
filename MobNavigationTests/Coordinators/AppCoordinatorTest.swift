//
//  AppCoordinatorTest.swift
//  MobNavigationTests
//
//  Created by Saurabh Dave on 1/29/23.
//

import XCTest
@testable import MobNavigation

final class AppCoordinatorTest: XCTestCase {
    
    var coordinator: AppCoordinator!
    let data = NavigationData(data: Bundle.main.getStringPath("character.png"))
    
    override func setUp() {
        super.setUp()
        
        coordinator = AppCoordinator(window: UIWindow(), navigationController: NavigationControllerMock())
    }
    
    override func tearDown() {
        coordinator = nil
        super.tearDown()
    }
    
    func testCoordinatorArrayInitializedOfEmptyArray() {
        XCTAssertTrue(coordinator.childCoordinators.isEmpty)
    }
    
    func testCoordinatorAddDependency() {
        
        coordinator.addChildCoordinator(coordinator)
        XCTAssertTrue(coordinator.childCoordinators.first is AppCoordinator)
        XCTAssertTrue(coordinator.childCoordinators.count == 1)
        coordinator.addChildCoordinator(coordinator)
        XCTAssertTrue(coordinator.childCoordinators.count == 1, "Only unique reference could be added")
        
        let newCoordinator = AppCoordinator(window: UIWindow())
        coordinator.addChildCoordinator(newCoordinator)
        XCTAssertTrue(coordinator.childCoordinators.count == 2)
    }
    
    func testCoordinatorRemoveDependency() {
        
        coordinator.addChildCoordinator(coordinator)
        XCTAssertTrue(coordinator.childCoordinators.first is AppCoordinator)
        coordinator.removeChildCoordinator(coordinator)
        XCTAssertTrue(coordinator.childCoordinators.isEmpty)
        coordinator.removeChildCoordinator(coordinator)
        XCTAssertTrue(coordinator.childCoordinators.isEmpty, "If we try to remove removed referense, crush can't happend")
    }
    
    func testStart() {
        
        coordinator.start()
        // goTo(route: .first) must call
        XCTAssertTrue(coordinator.navigationController.first is FirstViewController)
        XCTAssertTrue(coordinator.navigationController.count == 1)
    }
}

///
/// Default Flow: 1 --> 2 --> 3
///
extension AppCoordinatorTest {
    
    func testDefaultFlowToSecondScreen() {
        
        coordinator.start()
        
        // nextButtonTapped event, Navigate to SecondViewController
        coordinator?.goToNextScreen(data: data)

        XCTAssertTrue(coordinator.navigationController.last is SecondViewController)
        XCTAssertTrue(coordinator.navigationController.count == 2)
    }
    
    func testDefaultFlowToThirdScreen() {
        
        coordinator.start()
        
        // nextButtonTapped event, Navigate to SecondViewController
        coordinator?.goToNextScreen(data: data)
        
        // URL link clicked, Navigate to ThirdViewController
        coordinator?.goToNextScreen(data: data)

        XCTAssertTrue(coordinator.navigationController.last is ThirdViewController)
        XCTAssertTrue(coordinator.navigationController.count == 3)
    }
    
}

///
/// Non-Default Flow: 1 --> 3 --> 2
///
extension AppCoordinatorTest {
    
    func testNonDefaultFlowToThirdScreen() {
        
        // Push FirstViewController
        coordinator.start()
        
        // Set isDefaultFlow to false
        coordinator?.toggleNavigationFlow.send(false)
        
        // nextButtonTapped event, Navigate to ThirdViewController
        coordinator?.goToNextScreen(data: data)

        XCTAssertTrue(coordinator.navigationController.last is ThirdViewController)
        XCTAssertTrue(coordinator.navigationController.count == 2)
    }
    
    func testNonDefaultFlowToSecondScreen() {
        
        // Push FirstViewController
        coordinator.start()
        
        // Set isDefaultFlow to false
        coordinator?.toggleNavigationFlow.send(false)

        // nextButtonTapped event, Navigate to ThirdViewController
        coordinator?.goToNextScreen(data: data)
        
        // URL link clicked, Navigate to SecondViewController
        coordinator?.goToNextScreen(data: data)

        XCTAssertTrue(coordinator.navigationController.last is SecondViewController)
        XCTAssertTrue(coordinator.navigationController.count == 3)
    }
    
}
