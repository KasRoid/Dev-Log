//
//  CategoryViewController.swift
//  Dominos11_Starter
//
//  Created by Lee on 2020/05/26.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    lazy var categoryTableView = UITableView(frame: view.frame, style: .grouped)
    weak var delegate: CategroyViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.title = "Domino's"
        categoryTableView.sectionHeaderHeight = 300
        categoryTableView.rowHeight = 100
        categoryTableView.backgroundColor = .white
        categoryTableView.dataSource = self
        categoryTableView.delegate = self
        categoryTableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        view.addSubview(categoryTableView)
        
        products.setPriceOfEachItem()
    }
    
    private func buttonPressed() {
    }
}

extension CategoryViewController: UITableViewDataSource {
    
    // Section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 300))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: header.frame.width, height: header.frame.height))
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        header.addSubview(imageView)
        return header
    }
    
    // Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.productsTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath)
        let customCell = cell as! CustomCell
        self.delegate = customCell
        self.delegate?.sendIndexPath(indexPath)
        customCell.textLabel?.text = products.productsTitle[indexPath.row]
        return cell
    }
    
}

extension CategoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productViewController = ProductViewController()
        self.delegate = productViewController
        self.delegate?.sendIndexPath(indexPath)
        navigationController?.pushViewController(productViewController, animated: true)
    }
}

protocol CategroyViewDelegate: class {
    func sendIndexPath(_ data: IndexPath)
}
