//
//  CustomView.swift
//  Closure_As_Delegate
//
//  Created by Doyoung Song on 7/20/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    // MARK: - Properties
    let button = UIButton(type: .system)
    var btnActionHandler: (() -> ())?
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureUI() {
        button.setTitle("Button", for: .normal)
        button.addTarget(self, action: #selector(handleButton(_:)), for: .touchUpInside )
        addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        [
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ].forEach { $0.isActive = true }
    }
    
    func configureView(text: @escaping ()->()) {
        
    }
    
    @objc func handleButton(_ sender: UIButton) {
        btnActionHandler?()
    }
}
