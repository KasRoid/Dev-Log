//
//  ViewController.swift
//  StoryboardExample
//
//  Created by Kas Song on 2020.05.07.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Segue 를 실행할지 말지 정하는 메소드
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        let plus = identifier == "PlusOne" ? 1 : 10
        return count + plus <= 40
    }
    
    
    // 화면 전환에 따른 사전작업을 하는 메소드
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let secondVC = segue.destination as? SecondViewController else {return}
        
        switch segue.identifier {
        case "PlusOne":
            count += 1
        case "PlusTen":
            count += 10
        default:
            print("")
        }
        
        secondVC.text = String(count)
    }
    
    @IBAction private func performManualSegue(_ sender: Any) {
        let randomID = ["", "", ""].randomElement()!
        performSegue(withIdentifier: "FirstToSecond", sender: sender)
    }
    
    @IBAction func unwindToViewController(_ unwindSegue: UIStoryboardSegue) {
        guard let secondVC = unwindSegue.source as? SecondViewController else {return}
        
        let inputNum = Int(secondVC.subtractingTextField.text!)!
        count -= inputNum
        secondVC.text = String(count)
    }

}

