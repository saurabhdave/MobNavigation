//
//  UITextView+Link.swift
//  MobNavigation
//
//  Created by Saurabh Dave on 1/28/23.
//

import UIKit

// Extension to UITextView to add hyperlink functionality
public extension UITextView {
    
    /// Adds a hyperlink to the text view for the specified text and link.
    /// - Parameters:
    ///   - text: The text to be displayed as a hyperlink.
    ///   - link: The URL to be opened when the text is tapped.
    func makeLink(text: String, link: String) {
        // Create an attributed string with the given text
        let attributedString = NSMutableAttributedString(string: text)
        let range = NSRange(location: 0, length: text.count)
        // Add a link attribute to the attributed string
        attributedString.addAttribute(.link, value: link, range: range)
        // Set the attributed string to the text view
        self.attributedText = attributedString
        // Disable editing on the text view
        self.isEditable = false
        // Enable link detection on the text view
        self.dataDetectorTypes = .link
    }
}
