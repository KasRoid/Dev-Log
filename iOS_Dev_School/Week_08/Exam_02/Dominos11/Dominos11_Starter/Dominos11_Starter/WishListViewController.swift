//
//  WishListViewController.swift
//  Dominos11_Starter
//
//  Created by Lee on 2020/05/26.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class WishListViewController: UIViewController {
    
    var productsOnCart: Array<String> = []
    
    // Buttons & TableView
    lazy var clearButton = UIBarButtonItem(title: "목록 지우기", style: .plain, target: self, action: #selector(clearButtonAction(_:)))
    lazy var orderButton = UIBarButtonItem(title: "주문", style: .plain, target: self, action: #selector(orderButtonAction(_:)))
    
    let tableView = UITableView()
    
    // AlertControllers
    lazy var alertController = UIAlertController(title: "결제내역", message: products.totalPayment(), preferredStyle: .alert)
    lazy var cancelAction = UIAlertAction(title: "돌아가기", style: .cancel, handler: nil)
    lazy var payAction = UIAlertAction(title: "결제하기", style: .default, handler: { _ in self.alertButtonAction() })
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        alertController.message = products.totalPayment()
        tableView.reloadData()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        // BarButton Items
        navigationItem.title = "Wish List"
        navigationItem.leftBarButtonItem = clearButton
        navigationItem.rightBarButtonItem = orderButton
        
        // TableView Attributes
        tableView.frame = view.frame
        tableView.rowHeight = 100
        
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID") // 다른 테이블 스타일을 쓸 때는 비활성화해야하는듯??
        tableView.dataSource = self
        view.addSubview(tableView)
        
        alertController.addAction(cancelAction)
        alertController.addAction(payAction)
    }
    
    // MARK: Button Actions
    @objc func clearButtonAction(_ sender: UIButton) {
        alertButtonAction()
    }
    @objc func orderButtonAction(_ sender: UIButton) {
        present(alertController, animated: true)
    }
    
    func alertButtonAction() {
        products.reset()
        alertController.message = products.totalPayment()
        tableView.reloadData()
    }
}


// MARK: - UITableViewDataSource
extension WishListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.countingProductsOnCart()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "CellID")
        cell = tableView.dequeueReusableCell(withIdentifier: "CellID") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "CellID")
        cell.textLabel?.text = products.itemOnCart[indexPath.row]
        cell.imageView?.image = UIImage(named: products.itemOnCart[indexPath.row])
        if let value = products.receipt[products.itemOnCart[indexPath.row]] {
                cell.detailTextLabel?.text = "주문수량: \(value)"
        }
        else {
            cell.detailTextLabel?.text = "Error"
        }
        return cell
    }
}
