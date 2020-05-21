//
//  MainViewController.swift
//  CalculaorThirdTry
//
//  Created by Kas Song on 2020.05.20.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var calculateBrain = CalculateBrain()
    
    var mainView: UIView = {
        let view = UIView()
        return view
    }()
    var mainLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 70)
        label.textColor = .white
        label.textAlignment = .right
//        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.lightGray.cgColor
        return label
    }()
    var firstLineStackView = UIStackView() // 1,2,3,+
    var secondLineStackView = UIStackView() // 4,5,6,-
    var thirdLineStackView = UIStackView() // 7,8,9,×
    var fourthLineStackView = UIStackView() // 0,AC,=,÷
    lazy var totalStackView = UIStackView(arrangedSubviews: [firstLineStackView, secondLineStackView, thirdLineStackView, fourthLineStackView])
    
//    var btnArray = ["btn1", "btn2", "btn3", "btn4", "btn5", "btn6", "btn7", "btn8", "btn9", "btn0", "btnAdd", "btnSubtract", "btnMultiply", "btnDivide", "btnEqual", "btnReset"]
    
    var btnWithTitleLabelArray = ["1","2","3","+","4","5","6","-","7","8","9","×","0","AC","=","÷"] // 이후 함수에서 자동적으로 알맞은 스택뷰에 할당될 수 있도록 배열

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        staticUI()
        stackViewUI()                       
        updateUI()
    }
    
    func staticUI() {
        generateButtons()
    }
    
    // 버튼 속성 정의 및 스택뷰에 할당
    func generateButtons() {
        
        var totalArrayCounter = 0
        var subviewArrayCounter = 0
        
        for i in 0...btnWithTitleLabelArray.count - 1 {
            let defaultButton = UIButton()
            defaultButton.setTitle(btnWithTitleLabelArray[i], for: .normal)
            defaultButton.titleLabel?.font =  UIFont.systemFont(ofSize: 50)
            defaultButton.layer.cornerRadius = 47
            defaultButton.backgroundColor = .lightGray
            defaultButton.addTarget(self, action: #selector(bunttonPressed(_:)), for: .touchUpInside)
            
            (totalStackView.arrangedSubviews[totalArrayCounter] as! UIStackView).addArrangedSubview(defaultButton) // 각 스택뷰에 버튼을 순서대로 추가
            subviewArrayCounter += 1 // 버튼이 추가될 때마다 카운팅
            if subviewArrayCounter >= 4 { // 버튼이 4개가 되면 다음 스택뷰에 추가할 수 있도록 세팅
                totalArrayCounter += 1
                subviewArrayCounter = 0
            }
        }
    }
    
    // 모든 스택뷰의 속성 정의
    func stackViewUI() {
        // 각 4개의 버튼을 가진 스택뷰의 버튼을 가로로 배치되도록 설정
        [firstLineStackView, secondLineStackView, thirdLineStackView, fourthLineStackView].forEach() {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.alignment = .fill
            $0.spacing = 8
        }
        
        // 각각 4개의 버튼을 가진 가로 스택뷰를 세로로 배치한 최종 스택뷰
        totalStackView.axis = .vertical
        totalStackView.distribution = .fillEqually
        totalStackView.alignment = .fill
        totalStackView.spacing = 8
    }
    
    // 메인 레이블 텍스트 업데이트
    func updateUI() {
        view.addSubview(mainView)
        view.addSubview(mainLabel)
        view.addSubview(totalStackView)
        
        let safeArea = view.safeAreaLayoutGuide
        // 키패드와 뷰의 비율 조정
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0).isActive = true
        mainView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 0).isActive = true
        mainView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 0).isActive = true
        mainView.heightAnchor.constraint(equalToConstant: 420).isActive = true
        
        // 숫자가 표시될 레이블을 키패드 바로 위에 배치될 수 있도록 작업
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10).isActive = true
        mainLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10).isActive = true
        mainLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 0).isActive = true
        mainLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        // 키패드가 뷰의 상단부터 바로 이어져 내려와 좌,우,하단이 꽉차도록 설정
        totalStackView.translatesAutoresizingMaskIntoConstraints = false
        totalStackView.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 1).isActive = true
        totalStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10).isActive = true
        totalStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10).isActive = true
        totalStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 0).isActive = true
        
        mainLabel.text = calculateBrain.displayOnScreen
        if mainLabel.text == "" {
            mainLabel.text = "0"
        }
    }
    
    @objc func bunttonPressed(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel?.text else {
            print("buttonPressed: Guard Activated")
            return
        }
        switch buttonTitle {
        case "+", "-", "×", "÷", "=" :
            calculateBrain.operatorInputInString = buttonTitle
//            print("Operator \(buttonTitle) button is pressed")
        case "AC" :
            calculateBrain.resetButtonActivated()
//            print("AC button is pressed")
        default:
            calculateBrain.digitInputInString = buttonTitle
//            print("Number '\(buttonTitle)' is pressed")
        }
        updateUI()
    }
}
