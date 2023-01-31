# MobNavigation
App using Coordinator pattern, MVVM and Combine.
This project implements screen navigation in a navigation controller-based app using the coordinator pattern.

## Getting Started

These instructions will help you set up the project and run it on your local machine for development and testing purposes.

## Prerequisites
You will need to have Xcode installed on your machine to run this project.

## Installing
Follow these steps to get the project up and running on your local machine.

Clone the repository to your local machine using the following command:
bash
Copy code
git clone https://github.com/saurabhdave/MobNavigation.git
Open the project in Xcode.
Run the project on a simulator or device by clicking the play button in Xcode.
Running the tests

The project includes tests for each of the coordinator and view model classes. To run these tests, simply click on the Test navigator in Xcode and click on the play button next to each test class.

## Built With

Xcode - The development environment used

## How it Works

The project consists of several view controllers, each of which is responsible for a specific screen. Each view controller is connected to a corresponding coordinator which handles navigation between screens. The coordinators are connected in a hierarchy to provide a clear flow of navigation through the application.

The coordinator pattern allows for a separation of responsibilities between the view controllers and the navigation logic, resulting in a more maintainable and testable codebase.

## Conclusion

This project serves as a simple example of how to implement the coordinator pattern for screen navigation in iOS applications. Feel free to use the code and patterns demonstrated in this project for your own needs and further explore the possibilities of the coordinator pattern.

## Authors

Saurabh Dave - Initial work
See also the list of contributors who participated in this project.


## Acknowledgments

