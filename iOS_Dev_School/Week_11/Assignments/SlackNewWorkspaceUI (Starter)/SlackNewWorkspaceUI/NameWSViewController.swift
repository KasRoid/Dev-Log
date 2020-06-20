//
//  NameWSViewController.swift
//  SlackNewWorkspaceUI
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class NameWSViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var previousButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem(image: UIImage(systemName: "xmark")?.withTintColor(.black, renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(handlePreviousButton(_:)))
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
        textField.returnKeyType = .go
        textField.enablesReturnKeyAutomatically = true
        textField.delegate = self
        textField.becomeFirstResponder()
        return textField
    }()
    
    private lazy var customTextFieldPlaceHolder: UILabel = {
        let label = UILabel()
        label.text = "Name your workspace"
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var mainTextFieldLabel: UILabel = {
        let label = UILabel()
        label.text = "Name your workspace"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.alpha = 0
        return label
    }()
    
    private var textFieldIndicator = UIActivityIndicatorView()
    private var mainTextFieldCenterXAnchor: NSLayoutConstraint!
    private var mainTextFieldLabelCenterYAnchor: NSLayoutConstraint!
    private var indicatorLeadingAcnhor: NSLayoutConstraint!
    private var textSize: CGSize? {
        didSet {
            if let textWidth = textSize?.width {
                indicatorLeadingAcnhor.constant = textWidth
            }
        }
    }
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    // MARK: - UI
    private func configureUI() {
        view.backgroundColor = .white
        
        navigationItem.leftBarButtonItems = [previousButton]
        navigationItem.rightBarButtonItems = [nextButton]
        
        [mainTextField, mainTextFieldLabel, textFieldIndicator, customTextFieldPlaceHolder].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        mainTextFieldCenterXAnchor = mainTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        mainTextFieldLabelCenterYAnchor = mainTextFieldLabel.centerYAnchor.constraint(equalTo: mainTextField.centerYAnchor, constant: -20)
        indicatorLeadingAcnhor = textFieldIndicator.leadingAnchor.constraint(equalTo: mainTextField.leadingAnchor, constant: 0)
        
        [mainTextFieldCenterXAnchor, mainTextFieldLabelCenterYAnchor, indicatorLeadingAcnhor].forEach { $0?.isActive = true }
        
        NSLayoutConstraint.activate([
            mainTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -130),
            mainTextField.widthAnchor.constraint(equalToConstant: view.bounds.width - 40),
            mainTextField.heightAnchor.constraint(equalToConstant: 50),
            
            mainTextFieldLabel.leadingAnchor.constraint(equalTo: mainTextField.leadingAnchor),
            
            textFieldIndicator.heightAnchor.constraint(equalToConstant: 50),
            textFieldIndicator.widthAnchor.constraint(equalToConstant: 50),
            //            textFieldIndicator.leadingAnchor.constraint(equalTo: mainTextField.trailingAnchor, constant: 0),
            textFieldIndicator.centerYAnchor.constraint(equalTo: mainTextField.centerYAnchor, constant: 0),
            
            customTextFieldPlaceHolder.centerYAnchor.constraint(equalTo: mainTextField.centerYAnchor, constant: 0),
            customTextFieldPlaceHolder.leadingAnchor.constraint(equalTo: mainTextField.leadingAnchor, constant: 0)
        ])
    }
    
    
    // MARK: - Selectors
    @objc private func handlePreviousButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    @objc private func handleNextButton(_ sender: UIBarButtonItem) {
        pushToNextPage()
    }
    
    
    // MARK: - Private Methods
    private func pushToNextPage() {
        guard mainTextField.text != "Error" && mainTextField.text != "Fail" else {
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.04
            animation.repeatCount = 2
            animation.autoreverses = true
            animation.fromValue = NSValue(cgPoint: CGPoint(x: mainTextField.center.x - 5, y: mainTextField.center.y))
            animation.toValue = NSValue(cgPoint: CGPoint(x: mainTextField.center.x + 5, y: mainTextField.center.y))
            mainTextField.layer.add(animation, forKey: "position")
            return
        }
        guard !textFieldIndicator.isAnimating else { return }
        textFieldIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7, execute: {
            self.textFieldIndicator.stopAnimating()
            self.navigationController?.pushViewController(UrlWSViewController(), animated: true)
        })
    }
}


// MARK: - UITextFieldDelegate
extension NameWSViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let text = textField.text {
            textSize = (text as NSString).size(withAttributes: [NSAttributedString.Key.font : textField.font!])
        }
        let textFieldIsEmpty = textField.text?.isEmpty ?? true
        if textFieldIsEmpty {
            nextButton.isEnabled = false
            customTextFieldPlaceHolder.alpha = 1
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
            customTextFieldPlaceHolder.alpha = 0
            UIView.animate(
                withDuration: 0.3,
                animations: {
                    self.mainTextFieldLabelCenterYAnchor.constant = -40
                    self.mainTextFieldLabel.alpha = 1
                    self.view.layoutIfNeeded()
            })
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushToNextPage()
        return true
    }
}

