//
//  FirstViewController.swift
//  MobNavigation
//
//  Created by Saurabh Dave on 1/27/23.
//

import UIKit

class FirstViewController: UIViewController, Storyboarded {
    
    // MARK: - Properties
    
    private var viewModel : FirstViewModel?
    @IBOutlet weak var nextScreenButton: UIButton!
    
    // MARK: - Initialization
    
    /// For Dependency Injection
    /// Sets the FirstViewModel for this controller.
    /// - Parameter viewModel: The view model to be set.
    func setViewModel(viewModel: FirstViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nextScreenButton.setTitle(Strings.FirstScreen.nextScreenButtonTitle, for: .normal)
    }
    
    // MARK: - Actions
    
    @IBAction func toggleScreensFlow(_ sender: UISwitch) {
        viewModel?.navigationFlowDefault = sender.isOn
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        viewModel?.goToNextScreen()
    }
}

