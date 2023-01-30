//
//  DataPassing.swift
//  MobNavigation
//
//  Created by Saurabh Dave on 1/28/23.
//

import Foundation

/// Protocol for passing data between different views
protocol DataPassing {
    // The data to be passed
    var data: String? { get set }
}
