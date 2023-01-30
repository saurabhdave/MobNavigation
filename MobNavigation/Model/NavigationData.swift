//
//  NavigationData.swift
//  MobNavigation
//
//  Created by Saurabh Dave on 1/28/23.
//

import Foundation

/// Struct for holding navigation data that can be passed between different components in the application.
struct NavigationData: DataPassing {
    var data: String?
    
    /// Computed property to get the reversed URL string representation of `data`.
    public var reversedDataString: String? {
        return data?.reverseUrl()
    }
}

extension NavigationData: Equatable {
    /// Function to compare two instances of NavigationData.
    static func == (lhs: NavigationData, rhs: NavigationData) -> Bool {
        return lhs.data == rhs.data
    }
}
