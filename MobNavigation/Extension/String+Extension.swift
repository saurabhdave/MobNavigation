//
//  String+Extension.swift
//  MobNavigation
//
//  Created by Saurabh Dave on 1/28/23.
//

import Foundation

/// Extension on `String` to provide localization support and other utility methods
extension String {
    
    /// Localized string based on the current language settings
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    /// Returns the string with its characters reversed
    func reversedString() -> String {
        return String(self.reversed())
    }
    
    /// Returns the reversed URL string by splitting and reversing the components
    func reverseUrl() -> String {
        var reversedUrl = ""
        let components = self.split(separator: "/")
        for component in components.reversed() {
            reversedUrl += "/\(component)"
        }
        return reversedUrl
    }
}
