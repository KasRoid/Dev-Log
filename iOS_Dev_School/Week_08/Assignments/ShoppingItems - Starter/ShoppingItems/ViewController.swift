//
//  ViewController.swift
//  ShoppingItems
//
//  Created by giftbot on 2020. 05. 26..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as! ItemCell
        for _ in 1...cell.itemTitle.count {
            cell.itemCount.append(0)
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ItemCell.self, forCellReuseIdentifier: "ItemCell")
        tableView.frame = view.frame
        tableView.rowHeight = 80
        view.addSubview(tableView)
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as! ItemCell
        let numberOfProducts = cell.itemTitle.count
        return numberOfProducts
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.btnCount.tag = indexPath.row
        cell.countLabel.tag = indexPath.row
        
        let products = cell.itemsInStock
        let productsDetail = "\(products[cell.itemTitle[indexPath.row]]![0])"
        cell.imageView?.image = UIImage(named: productsDetail)
        cell.textLabel?.text = cell.itemTitle[indexPath.row]
        cell.countLabel.text = String(cell.itemCount[indexPath.row])
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
//        cell.countLabel.text = String(cell.itemCount[indexPath.row])
    }
}

