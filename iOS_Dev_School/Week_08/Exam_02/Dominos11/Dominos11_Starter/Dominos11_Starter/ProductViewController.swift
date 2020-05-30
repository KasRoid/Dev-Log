//
//  ProductViewController.swift
//  Dominos11_Starter
//
//  Created by Lee on 2020/05/26.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
    let tableView = UITableView()
    var indexPathFromCategoryViewController: IndexPath = IndexPath(row: 0, section: 0)
    var kindsOfProducts = ""
    weak var delegate: ProductsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    // MARK: - SetupUI
    private func setupUI() {
        title = products.productsTitle[indexPathFromCategoryViewController.row]
        tableView.frame = view.frame
        tableView.rowHeight = 120
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
}

// MARK: - UITableViewDataSource
extension ProductViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let nameOfProduct = products.productsTitle[indexPathFromCategoryViewController.row]
        return products.productsDetail[nameOfProduct]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let nameOfProduct = products.productsTitle[indexPathFromCategoryViewController.row]
        cell.textLabel?.text = products.productsDetail[nameOfProduct]![indexPath.row]
        cell.textLabel?.textColor = .black
        cell.backgroundColor = .white
        cell.imageView?.image = UIImage(named: products.productsDetail[nameOfProduct]![indexPath.row])
        return cell
    }
}

extension ProductViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        self.delegate = detailViewController
        self.delegate?.sendIndexPath(indexPath, kindsOfProducts)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension ProductViewController: CategroyViewDelegate {
    func sendIndexPath(_ data: IndexPath) {
        indexPathFromCategoryViewController = data
        kindsOfProducts = products.productsTitle[indexPathFromCategoryViewController.row]
    }
}

// MARK: - Declared Protocol Delegate
protocol ProductsViewControllerDelegate: class {
    func sendIndexPath(_ data: IndexPath, _ title: String)
}
