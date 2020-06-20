//
//  UrlWSViewController.swift
//  SlackNewWorkspaceUI
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class UrlWSViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var previousButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(handlePreviousButton(_:)))
        return barButton
    }()
    
    private lazy var nextButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(handleNextButton(_:)))
        barButton.isEnabled = false
        return barButton
    }()
    
    private lazy var mainTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 24)
        textField.delegate = self
        textField.becomeFirstResponder()
        return textField
    }()
    
    private lazy var customTextFieldPlaceHolder: UILabel = {
        let label = UILabel()
        label.text = "slack.com"
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var mainTextFieldLabel: UILabel = {
        let label = UILabel()
        label.text = "Get a URL (Letter, numbers, and dashes only)"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.alpha = 0
        return label
    }()
    
    private lazy var subLabel: UILabel = {
        let label = UILabel()
        label.text = "This is the addresss that you'll use to sign in to Slack"
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    private lazy var textFieldErrorLabel: UILabel = {
        let label = UILabel()
        label.text = "This URL is not available Sorry!"
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    private var customTextFieldPlaceHolderLeadingAnchor: NSLayoutConstraint!
    private var mainTextFieldLabelCenterYAnchor: NSLayoutConstraint!
    private var textSize: CGSize? {
        didSet {
            let size = textSize?.width ?? 0
            customTextFieldPlaceHolderLeadingAnchor.constant = size + 5
        }
    }
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }
    
    
    // MARK: - UI
    private func configureUI() {
        view.backgroundColor = .white
        
        navigationItem.leftBarButtonItems = [previousButton]
        navigationItem.rightBarButtonItems = [nextButton]
        
        [mainTextField, mainTextFieldLabel, customTextFieldPlaceHolder, subLabel].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        mainTextFieldLabelCenterYAnchor = mainTextFieldLabel.centerYAnchor.constraint(equalTo: mainTextField.centerYAnchor, constant: -20)
        mainTextFieldLabelCenterYAnchor.isActive = true
        customTextFieldPlaceHolderLeadingAnchor = customTextFieldPlaceHolder.leadingAnchor.constraint(equalTo: mainTextField.leadingAnchor, constant: 0)
        customTextFieldPlaceHolderLeadingAnchor.isActive = true
        
        NSLayoutConstraint.activate([
            mainTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -130),
            mainTextField.heightAnchor.constraint(equalToConstant: 50),
            mainTextField.widthAnchor.constraint(equalToConstant: view.bounds.width - 40),
            
            mainTextFieldLabel.leadingAnchor.constraint(equalTo: mainTextField.leadingAnchor),
            
            customTextFieldPlaceHolder.centerYAnchor.constraint(equalTo: mainTextField.centerYAnchor, constant: 0),
            
            subLabel.leadingAnchor.constraint(equalTo: mainTextField.leadingAnchor, constant: 0),
            subLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10)
        ])
    }
    
    
    // MARK: - Selectors
    @objc private func handlePreviousButton(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    @objc private func handleNextButton(_ sender: UIBarButtonItem) {
        pushToNextPage()
    }
    
    
    // MARK: - Private Methods
    private func pushToNextPage() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7, execute: {
        })
    }
}


// MARK: - UITextFieldDelegate
extension UrlWSViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let text = textField.text {
            textSize = (text as NSString).size(withAttributes: [NSAttributedString.Key.font : textField.font!])
        }
        let textFieldIsEmpty = textField.text?.isEmpty ?? true
        if textFieldIsEmpty {
            nextButton.isEnabled = false
            UIView.animate(
                withDuration: 0.3,
                animations: {
                    self.mainTextFieldLabelCenterYAnchor.constant = -20
                    self.mainTextFieldLabel.alpha = 0
                    self.view.layoutIfNeeded()
            })
        }
        else {
            nextButton.isEnabled = true
            UIView.animate(
                withDuration: 0.3,
                animations: {
                    self.mainTextFieldLabelCenterYAnchor.constant = -40
                    self.mainTextFieldLabel.alpha = 1
                    self.view.layoutIfNeeded()
            })
        }
    }
}
