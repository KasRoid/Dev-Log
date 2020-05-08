//
//  ViewController.swift
//  UserDefaults
//
//  Created by giftbot on 2020. 05. 06..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

  @IBOutlet private weak var datePicker: UIDatePicker!
  @IBOutlet private weak var alertSwitch: UISwitch!

  // MARK: Action Handler
  
  @IBAction func saveData(_ button: UIButton) {
    UserDefaults.standard.set(datePicker.date, forKey: "date")
    UserDefaults.standard.set(alertSwitch.isOn, forKey: "alarm")
    
    //userdefaults 를 이용해서 alarm switch 의 값 저장
    //datePicker 의 값 저장
  }
  
  @IBAction func loadData(_ button: UIButton) {
    if let defaultDate = UserDefaults.standard.object(forKey: "date") as? Date {
        datePicker.setDate(defaultDate, animated: true)
    }
    let defaultAlarm = UserDefaults.standard.bool(forKey: "alarm")
    alertSwitch.isOn = defaultAlarm
    
    // alarm 의 스위치 값 로드, datePicker 의 값 로드
    // switch 와 datePicker에 불러온 값을 세팅
  }
}

