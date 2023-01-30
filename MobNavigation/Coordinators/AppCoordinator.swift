//
//  AppCoordinator.swift
//  MobNavigation
//
//  Created by Saurabh Dave on 1/27/23.
//

import UIKit
import Combine

/// AppCoordinator class conforms to the Coordinator protocol and implements the necessary methods to manage the navigation flow of the application
class AppCoordinator: NSObject, Coordinator {
    
    // The window property represents the main window of the application
    let window: UIWindow
    
    // The childCoordinators property holds an array of child coordinators
    var childCoordinators = [Coordinator]()
    
    // The navigationController property represents the main navigation controller of the application
    var navigationController: UINavigationController
    
    // The toggleNavigationFlow property is a CurrentValueSubject used to toggle the navigation flow between the default flow and the alternate flow
    let toggleNavigationFlow = CurrentValueSubject<Bool,Never>(true) // default flow is true
    
    // The subscriptions property is a set of cancellables used to manage the subscriptions created in the sink method
    var subscriptions = Set<AnyCancellable>()
    
    // The isDefaultFlow property keeps track of the current navigation flow, true for the default flow and false for the alternate flow
    private var isDefaultFlow = true // Default Flow: 1 --> 2 --> 3
    
    // The init method initializes an instance of AppCoordinator and sets the window and navigationController properties
    public init(window:UIWindow, navigationController: UINavigationController = UINavigationController()) {
        self.window = window
        self.navigationController = navigationController
    }
    
    // The start method sets the root view controller of the window to the navigationController and sets the delegate of the navigationController to self
    func start() {
        window.rootViewController = self.navigationController
        self.navigationController.delegate = self
        
        // The sink method subscribes to the toggleNavigationFlow subject and sets the isDefaultFlow property to the value received from the toggleNavigationFlow subject
        toggleNavigationFlow.sink { [weak self] toggled in
            self?.isDefaultFlow = toggled
        }.store(in: &subscriptions)
        
        // The first time this coordinator started, is to launch First screen.
        goTo(route: .first)
    }
    
    // The goToNextScreen method takes data of type DataPassing as input and decides the next screen to navigate to based on the current screen and the current navigation flow
    func goToNextScreen(data: any DataPassing){
        var route: Route?
        
        // If the top view controller of the navigation controller is an instance of FirstViewController
        if navigationController.topViewController is FirstViewController {
            // If the current navigation flow is the default flow, navigate to the second screen
            route = isDefaultFlow == true ? Route.second(data: data) : Route.third(data: data)
        } else {
            // If the current navigation flow is the alternate flow, navigate to the second screen
            route = isDefaultFlow == false ? Route.second(data: data) : Route.third(data: data)
        }
        
        // Coordinator will navigate to specified Route
        if let route = route {
            goTo(route: route)
        }
    }
}

// Navigating to different screens
extension AppCoordinator {
    ///
    /// goTo function handles the navigation between different routes defined in the Route enum.
    ///  - Parameters: - route: The Route case that you want to navigate to.
    ///  - Returns: Void
    ///
    private func goTo(route: Route) {
        switch route {
        case .first:
            goToFirstScreen()
        case .second(let data):
            goToSecondScreen(data)
        case .third(let data):
            goToThirdScreen(data)
        }
    }
    
    private func goToFirstScreen() {
        // Instantiate FirstViewController
        let vc = FirstViewController.instantiate()
        vc.title = Strings.firstScreenTitle
        
        // Instantiate FirstViewModel
        let firstViewModel = FirstViewModel.init()
        
        // Set the Coordinator to the ViewModel
        firstViewModel.coordinator = self
        
        // Set the ViewModel to ViewController
        vc.setViewModel(viewModel: firstViewModel)
        
        self.navigationController.pushViewController(vc, animated: false)
    }
    
    private func goToSecondScreen(_ withData : any DataPassing) {
        // Instantiate SecondViewController
        let vc = SecondViewController.instantiate()
        vc.title = Strings.secondScreenTitle
        
        // Instantiate SecondViewModel
        let secondViewModel = SecondViewModel.init()
        
        // Set the Coordinator to the ViewModel
        secondViewModel.coordinator = self
        secondViewModel.isLastScreen = !isDefaultFlow
        // Set the Data to the ViewModel
        secondViewModel.data = withData
        
        // Set the ViewModel to ViewController
        vc.setViewModel(viewModel: secondViewModel)
        
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    private func goToThirdScreen(_ withData : any DataPassing) {
        // Instantiate ThirdViewController
        let vc = ThirdViewController.instantiate()
        vc.title = Strings.thirdScreenTitle
        
        // Instantiate ThirdViewModel
        let thirdViewModel = ThirdViewModel.init()
        
        // Set the Coordinator to the ViewModel
        thirdViewModel.coordinator = self
        thirdViewModel.isLastScreen = isDefaultFlow
        
        // Set the Data to the ViewModel
        thirdViewModel.data = withData
        
        // Set the ViewModel to ViewController
        vc.setViewModel(viewModel: thirdViewModel)
        
        self.navigationController.pushViewController(vc, animated: true)
    }
}

extension AppCoordinator: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // Read the view controller we’re moving from.
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        // Check whether our view controller array already contains that view controller. If it does it means we’re pushing a different view controller on top rather than popping it, so exit.
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
    }
    
}
