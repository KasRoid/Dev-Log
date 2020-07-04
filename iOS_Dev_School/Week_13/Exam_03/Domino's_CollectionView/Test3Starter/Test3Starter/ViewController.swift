//
//  ViewController.swift
//  Test3Starter
//
//  Created by Lee on 2020/07/03.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - Properties
    static var tableViewIndexPath: IndexPath = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.frame)
        tableView.allowsSelection = false
        tableView.rowHeight = 600
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCustomCell.self, forCellReuseIdentifier: TableViewCustomCell.identifier)
        return tableView
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - UI
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        navigationItem.title = "Domino's"
    }
}


// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dominoCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCustomCell.identifier, for: indexPath) as? TableViewCustomCell else { return UITableViewCell() }
        cell.titleImageView.image = UIImage(named: dominoCategory[indexPath.row])
        cell.tableViewIndexPath = indexPath
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        ViewController.tableViewIndexPath = indexPath
    }
}
