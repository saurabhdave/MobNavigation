//
//  Bundle+Extensions.swift
//  MobNavigation
//
//  Created by Saurabh Dave on 1/28/23.
//

import Foundation

extension Bundle {
    // Extension on Bundle class to provide URL and String path for a file
    // - Parameter file: name of the file
    // - Returns: URL of the file
    func getURL(_ file: String) -> URL {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) file")
        }
        return url
    }
    
    // Extension on Bundle class to provide URL and String path for a file
    // - Parameter file: name of the file
    // - Returns: String path of the file
    func getStringPath(_ file: String) -> String {
        guard let path = self.path(forResource: file, ofType: nil) else {
            fatalError("Failed to locate \(file) file")
        }
        return path
    }
}
