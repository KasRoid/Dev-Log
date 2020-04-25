//
//  ViewController.swift
//  UISegmentedControl_Practice
//
//  Created by Kas Song on 2020.04.24.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var containerXcode: UIView!
    @IBOutlet weak var containerSwift: UIView!
    @IBOutlet weak var imgXcode: UIImageView!
    @IBOutlet weak var imgSwift: UIImageView!
    @IBOutlet weak var tableViewXcode: UITableView!
    @IBOutlet weak var tableViewSwift: UITableView!
    
    
    var labelXcode = UILabel()
    var labelSwift = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Segmented Control
        segmentedControl.frame = CGRect(x: view.frame.minX + view.frame.maxX * 2 / 8, y: view.frame.minY + 50, width: 200, height: 30)
        segmentedControl.selectedSegmentIndex = 0
        didChangeSegment(segmentedControl)

        
        // 컨테이너
        containerXcode.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: view.frame.height)
        containerSwift.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: view.frame.height)
        
        
        // 레이블
        labelXcode.text = "Xcode"
        labelXcode.font = UIFont.systemFont(ofSize: 30)
        labelXcode.textColor = .black
        labelXcode.textAlignment = .center
        labelXcode.frame = CGRect(x: view.frame.midX - 100, y: view.frame.midY - 100, width: 200, height: 200)
        labelXcode.alpha = 0
        view.addSubview(labelXcode)

        labelSwift.text = "Swift"
        labelSwift.font = UIFont.systemFont(ofSize: 30)
        labelSwift.frame = CGRect(x: view.frame.midX - 100, y: view.frame.midY - 100, width: 200, height: 200)
        labelSwift.textAlignment = .center
        labelSwift.alpha = 0
        view.addSubview(labelSwift)
        
        
        // 이미지
        imgXcode.frame = CGRect(x: view.frame.midX - 100, y: view.frame.midY - 220, width: 200, height: 200)
        imgXcode.alpha = 0
        view.addSubview(imgXcode)
        
        imgSwift.frame = CGRect(x: view.frame.midX - 90, y: view.frame.midY - 220, width: 180, height: 180)
        imgSwift.alpha = 0
        view.addSubview(imgSwift)
        
        
        // 테이블
        tableViewXcode.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: view.frame.height)
        tableViewXcode.alpha = 0
        
        tableViewSwift.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: view.frame.height)
        tableViewSwift.alpha = 0
    }
    
    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 { // Segmented Control 에서 첫번째 메뉴가 선택되었을 때
            containerXcode.alpha = 1 // 해당 컨테이너를 보이게
            containerSwift.alpha = 0 // 해당 컨테이너를 보이지 않게
            labelXcode.alpha = 1
            labelSwift.alpha = 0
            imgXcode.alpha = 1
            imgSwift.alpha = 0
            tableViewXcode.alpha = 0
            tableViewSwift.alpha = 0
        }
        else if sender.selectedSegmentIndex == 1 {
            containerXcode.alpha = 0
            containerSwift.alpha = 1
            labelXcode.alpha = 0
            labelSwift.alpha = 1
            imgXcode.alpha = 0
            imgSwift.alpha = 1
            tableViewXcode.alpha = 0
            tableViewSwift.alpha = 0
        }
        else if sender.selectedSegmentIndex == 2 {
            containerXcode.alpha = 0
            containerSwift.alpha = 0
            labelXcode.alpha = 0
            labelSwift.alpha = 0
            imgXcode.alpha = 0
            imgSwift.alpha = 0
            tableViewXcode.alpha = 1
            tableViewSwift.alpha = 0
        }
        else if sender.selectedSegmentIndex == 2 {
            containerXcode.alpha = 0
            containerSwift.alpha = 0
            labelXcode.alpha = 0
            labelSwift.alpha = 0
            imgXcode.alpha = 0
            imgSwift.alpha = 0
            tableViewXcode.alpha = 0
            tableViewSwift.alpha = 1
        }
    }
}
