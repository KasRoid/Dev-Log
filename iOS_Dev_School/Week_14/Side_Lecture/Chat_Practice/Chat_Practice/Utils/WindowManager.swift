//
//  WindowManager.swift
//  Chat_Practice
//
//  Created by Doyoung Song on 7/8/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class WindowManager {
    enum VisibleViewControllerType {
        case sign
        case chat
        
        var controller: UIViewController {
            switch self {
            case .sign:
                return SignInViewController()
            case .chat:
                return UINavigationController(rootViewController: ChatViewController())
            }
        }
    }
    
    class func set(_ type: VisibleViewControllerType) {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = type.controller
        window.makeKeyAndVisible()
        
        delegate.window = window
    }
}

