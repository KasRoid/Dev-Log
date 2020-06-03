//
//  JsonViewController.swift
//  Dominos
//
//  Created by Lee on 2020/01/28.
//  Copyright © 2020 Up's. All rights reserved.
//

import UIKit

class JsonViewController: UIViewController {
  
  private let tableView = UITableView(frame: .zero, style: .grouped)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setNavigation()
    setUI()
    setConstraint()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    if let indexPath = tableView.indexPathForSelectedRow {
      tableView.deselectRow(at: indexPath, animated: true)
    }
  }
  
  private func setNavigation() {
    navigationItem.title = "Domino's"
  }
  
  private func setUI() {
    view.backgroundColor = .white
    
    tableView.dataSource = self
    tableView.delegate = self
    view.addSubview(tableView)
  }
  
  private func setConstraint() {
    let guide = view.safeAreaLayoutGuide
    
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
  }
}

extension JsonViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    guard let tempData = jsonData as? [Any] else { return 0 }
    return tempData.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard
      let tempData = jsonData as? [[String: Any]],
      let products = tempData[section]["products"] as? [Any]
      else { return 0 }
    
    return products.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell: UITableViewCell
    if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
      cell = reusableCell
    } else {
      cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
    }
    
    guard
      let tempData = jsonData as? [[String: Any]],
      let products = tempData[indexPath.section]["products"] as? [[String: Any]],
      let name = products[indexPath.row]["name"] as? String,
      let price = products[indexPath.row]["price"] as? Int
      else { fatalError() }
    
    cell.imageView?.image = UIImage(named: name)
    cell.textLabel?.text = name
    cell.detailTextLabel?.text = String(price) + " 원"
    //    cell.selectionStyle = .none
    
    return cell
  }
}

extension JsonViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let detailVC = DetailViewController()
    detailVC.productName = menuData[indexPath.section].products[indexPath.row].name
    navigationController?.pushViewController(detailVC, animated: true)
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let herderView = UIImageView()
    herderView.backgroundColor = .white
    herderView.image = UIImage(named: menuData[section].category)
    herderView.contentMode = .scaleAspectFit
    return herderView
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    80
  }
  
  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    nil
  }
  
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    0
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    120
  }
}
