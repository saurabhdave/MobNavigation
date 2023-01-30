//
//  ThirdViewController.swift
//  MobNavigation
//
//  Created by Saurabh Dave on 1/27/23.
//

import UIKit

class ThirdViewController: UIViewController, Storyboarded {
    
    // MARK: - Properties
    private var viewModel : ThirdViewModel!
    @IBOutlet weak var urlTextView: UITextView! {
        didSet {
            urlTextView.delegate = self
        }
    }
    
    // MARK: - Initialization
    
    /// For Dependency Injection
    /// Sets the ThirdViewModel for this controller.
    /// - Parameter viewModel: The view model to be set.
    func setViewModel(viewModel: ThirdViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        urlTextView.makeLink(text: viewModel.filePath, link: viewModel.filePath)
    }
    
}

// MARK: - UITextViewDelegate

extension ThirdViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        viewModel?.goToNextScreen(sourceLink: URL.absoluteString)
        return false
    }
}
