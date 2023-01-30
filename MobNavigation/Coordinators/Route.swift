//
//  Route.swift
//  MobNavigation
//
//  Created by Saurabh Dave on 1/29/23.
//

import Foundation

/// Enum Route is used to represent the different screens in the navigation flow of the application
enum Route {
    case first // represents the FirstViewController screen
    case second(data: any DataPassing) // represents the SecondViewController screen and takes data of type DataPassing as input
    case third(data: any DataPassing) // represents the ThirdViewController screen and takes data of type DataPassing as input
}
