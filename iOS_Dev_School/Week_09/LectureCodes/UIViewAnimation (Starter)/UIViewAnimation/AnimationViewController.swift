//
//  AnimationViewController.swift
//  UIViewAnimation
//
//  Created by giftbot on 2020. 6. 4..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class AnimationViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet private weak var userIdTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet private weak var countDownLabel: UILabel!
    
    var count = 4 {
        didSet { countDownLabel.text = "\(count)" }
    }
    
    // MARK: - View LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        userIdTextField.center.x = -view.frame.width
        passwordTextField.center.x = -view.frame.width
        loginButton.center.x = -view.frame.width
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Frame - 부모뷰 (0, 0)
        UIView.animate(withDuration: 0.6) {
            self.userIdTextField.center.x = self.userIdTextField.superview!.bounds.midX
        }
        UIView.animate(withDuration: 0.6, delay: 0.5, animations: {
            self.passwordTextField.center.x = self.passwordTextField.superview!.bounds.midX
        })
        
        UIView.animate(
            withDuration: 0.6,
            delay: 1,
            usingSpringWithDamping: 0.6, // 0 에 가까울수록 큰 진동
            initialSpringVelocity: 0, // 초기에 가해지는 힘
            options: [.curveEaseInOut], // 기본값, 가장 많이 쓰인다.
            animations: { self.loginButton.center.x = self.loginButton.superview!.bounds.midX },
            completion: { isFinished in print("isFinished: ", isFinished) }
        )
    }
    
    // MARK: - Action Handler
    
    @IBAction private func didEndOnExit(_ sender: Any) {
        
    }
    
    @IBAction private func login(_ sender: Any) {
        guard countDownLabel.isHidden else { return }
        loginButtonAnimation()
        countDown()
    }
    
    
    func addAnimateKeyframes() {
        UIView.animateKeyframes(
            withDuration: 4,
            delay: 0,
            options: [],
            animations: {
                UIView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: 0.25,
                    animations: {self.loginButton.center.x += 100.0}
                )
                // 1초 뒤 1초간 아래로 이동
                UIView.addKeyframe(
                    withRelativeStartTime: 0.25,
                    relativeDuration: 0.25,
                    animations: {self.loginButton.center.y += 100.0})
                
                // 2초 뒤 1초간 왼쪽으로 이동
                UIView.addKeyframe(
                    withRelativeStartTime: 0.5,
                    relativeDuration: 0.25,
                    animations: {self.loginButton.center.x -= 100.0})
                
                UIView.addKeyframe(
                    withRelativeStartTime: 0.75,
                    relativeDuration: 0.25,
                    animations: { self.loginButton.center.y -= 100.0 })
        })}
    
    func loginButtonAnimation() {
        // transfrom - 크기, 회전, 이동
        activityIndicatorView.startAnimating()
        let centerOrigin = loginButton.center
        
        UIView.animateKeyframes(
            withDuration: 3,
            delay: 0,
            options: [],
            animations: {
                UIView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: 0.20,
                    animations: {
                        self.loginButton.center.y += 100
                        self.loginButton.center.x += 50
                        self.loginButton.transform = CGAffineTransform(rotationAngle: .pi / 4)
                })
                UIView.addKeyframe(
                    withRelativeStartTime: 0.20,
                    relativeDuration: 0.50,
                    animations: {
                        self.loginButton.center.y -= 200
                        self.loginButton.center.x += 200
                })
                UIView.addKeyframe(
                    withRelativeStartTime: 0.50,
                    relativeDuration: 0.01,
                    animations: {
                        self.loginButton.center = centerOrigin
                        self.loginButton.transform = .identity
                })
        },
            completion: { _ in }
        )
    }
    
    func countDown() {
        countDownLabel.isHidden = false
        
        UIView.transition(
            with: self.countDownLabel,
            duration: 0.5, // 전환 애니메이션 지속시간
            options: [.transitionCrossDissolve],
            animations: { self.count -= 1 },
            completion: { _ in
                // 다음 카운트로 넘어갈 때까지 대기 시간
                // DispatchQueue 는 일정 작업을 queue 에 올려놓았다가 지정해 놓은 시간 뒤에 명령을 실행하게 한다.
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 ) {
                    guard self.count == 0 else { return self.countDown() }
                    self.count = 4
                    self.countDownLabel.isHidden = true
                    self.activityIndicatorView.stopAnimating() }
                }
        )
    }
}

