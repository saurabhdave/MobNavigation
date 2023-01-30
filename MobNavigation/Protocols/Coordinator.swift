//
//  Coordinator.swift
//  MobNavigation
//
//  Created by Saurabh Dave on 1/27/23.
//

import UIKit

// *******************************
// MARK: - Coordinator
// *******************************
///  The most basic type of `Coordinator`: one that manages other coordinators.

public protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
    func end()
    func destroyChildren(completion: (() -> Void)?)
}

public extension Coordinator {
    
    /**
     Adds a child coordinator to the parent, preventing it from getting deallocated in memory.
     
     - Parameter childCoordinator: The coordinator to keep allocated in memory.
     */
    
    // add only unique object
    func addChildCoordinator(_ coordinator: Coordinator) {
      guard !childCoordinators.contains(where: { $0 === coordinator }) else { return }
      childCoordinators.append(coordinator)
    }
    
    /**
     Removes a child coordinator from its parent, releasing it from memory.
     
     - Parameter childCoordinator: The coordinator to release.
     */

    func removeChildCoordinator(_ childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== childCoordinator }
    }
    
}


public extension Coordinator {
    /// The func `end()` dismiss all coordinator
    func end() {
        childCoordinators.removeAll()
        navigationController.popToRootViewController(animated: true)
    }
    
    /// This func dismiss all children coordinator
    func destroyChildren(completion: (() -> Void)?) {
        for child in childCoordinators {
            DispatchQueue.main.async {
                child.navigationController.dismiss(animated: true, completion: completion)
            }
        }
    }
}
