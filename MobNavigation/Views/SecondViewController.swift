//
//  SecondViewController.swift
//  MobNavigation
//
//  Created by Saurabh Dave on 1/27/23.
//

import UIKit

class SecondViewController: UIViewController, Storyboarded {
    
    // MARK: - Properties
    private var viewModel : SecondViewModel!
    @IBOutlet weak var urlTextView: UITextView! {
        didSet {
            urlTextView.delegate = self
        }
    }
    
    // MARK: - Initialization
    
    /// For Dependency Injection
    /// Sets the SecondViewModel for this controller.
    /// - Parameter viewModel: The view model to be set.
    func setViewModel(viewModel: SecondViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        urlTextView.makeLink(text: viewModel.reversedFilePath, link: viewModel.filePath)
    }
    
}

// MARK: - UITextViewDelegate

extension SecondViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        viewModel?.goToNextScreen(sourceLink: URL.absoluteString)
        
        return false
    }
}
