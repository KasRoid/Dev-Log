//
//  ViewController.swift
//  TableView_Practice
//
//  Created by Kas Song on 2020.05.26.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override var description: String { "TableView Practice" }
    
    let tableView = UITableView()
    let indexNumber = 30
    var data: Array<Int> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        for _ in 1...indexNumber {
            data.append(0)
        }
        
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.rowHeight = 80
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Default")
        tableView.register(CustomCell.self, forCellReuseIdentifier: "Custom")
        view.addSubview(tableView)
    }
    
    @objc func didTapButton(_ sender: UIButton) {
        data[sender.tag] += 1
        tableView.reloadData()
        print(sender.tag)
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return indexNumber
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Default", for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Custom", for: indexPath) as! CustomCell
//        cell.textLabel?.text = "\(data[indexPath.row])"
        
        if cell.textLabel?.text == nil {
            cell.addButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        }
        cell.addButton.tag = indexPath.row
        cell.textLabel?.text = "\(data[indexPath.row])"
        
        return cell
    }
    
}
