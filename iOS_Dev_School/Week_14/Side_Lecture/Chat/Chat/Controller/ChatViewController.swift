//
//  ChatViewController.swift
//  Chat
//
//  Created by Lee on 2020/07/08.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
  
  private let pChat = ChatProvider()
  
  private let messageTableView = UITableView()
  private let messageTextField = UITextField()
  
  private var bottomConstraint: NSLayoutConstraint?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setNavigation()
    setUI()
    setConstraint()
    setKeyboardNotification()
    setNetwork()
  }
  
  private func setNetwork() {
    pChat.addListener { (result) in
      switch result {
      case .failure(let error):
        self.alertNormal(title: error.localizedDescription)
        
      case .success:
        self.messageTableView.reloadData()
      }
    }
  }
}



// MARK: - UI

extension ChatViewController {
  private func setNavigation() {
    navigationItem.title = "Chat"
  }
  
  private func setUI() {
    view.backgroundColor = .systemBackground
    
    messageTextField.backgroundColor = .red
    messageTextField.font = .systemFont(ofSize: 35)
    messageTextField.delegate = self
    
    messageTableView.dataSource = self
  }
  
  private func setConstraint() {
    let guide = view.safeAreaLayoutGuide
    
    [messageTableView, messageTextField].forEach {
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
      $0.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    }
    
    NSLayoutConstraint.activate([
      messageTableView.topAnchor.constraint(equalTo: guide.topAnchor),
      messageTextField.topAnchor.constraint(equalTo: messageTableView.bottomAnchor)
    ])
    
    bottomConstraint = messageTextField.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
    bottomConstraint?.isActive = true
  }
}



extension ChatViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    pChat.messages.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
    
    let message = pChat.messages[indexPath.row]
    cell.textLabel?.text = message.content
    cell.detailTextLabel?.text = message.nickName
    
    return cell
  }
}



// MARK: - Notification

extension ChatViewController {
  private func setKeyboardNotification() {
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardNotificationAction(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardNotificationAction(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
  }
  
  @objc private func keyboardNotificationAction(_ notification: Notification) {
    guard
      let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double,
      let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt,
      let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
      else { return }
    let height = keyboardFrame.cgRectValue.height - view.safeAreaInsets.bottom
    
    UIView.animate(withDuration: duration, delay: 0, options: UIView.AnimationOptions(rawValue: curve), animations: {
      switch notification.name {
      case UIResponder.keyboardWillShowNotification:
        self.bottomConstraint?.constant = -height
        
      case UIResponder.keyboardWillHideNotification:
        self.bottomConstraint?.constant = 0
        
      default:
        break
      }
      self.view.layoutIfNeeded()
    })
  }
}



// MARK: - UITextFieldDelegate

extension ChatViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    guard let content = textField.text, !content.isEmpty else { return true }
    
    pChat.addMessage(content: content)
    
    return true
  }
}
