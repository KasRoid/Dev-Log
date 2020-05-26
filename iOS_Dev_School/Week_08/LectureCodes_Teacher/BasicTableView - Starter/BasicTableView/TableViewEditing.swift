//
//  TableViewEditing.swift
//  BasicTableView
//
//  Created by Giftbot on 2020/05/25.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class TableViewEditing: UIViewController {
  
  /***************************************************
   테이블뷰 목록 수정하기 (insert, delete 등)
   ***************************************************/
  
  override var description: String { "TableView - Editing" }
  
  let tableView = UITableView()
  var data = Array(1...50)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(
      title: "Edit", style: .plain, target: self, action: #selector(switchToEditing)
    )
  }
  
  func setupTableView() {
    tableView.frame = view.frame
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
    view.addSubview(tableView)
    
    let refreshControl = UIRefreshControl()
    refreshControl.attributedTitle = NSAttributedString(string: "Refreshing...")
    refreshControl.tintColor = .blue
    refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
    tableView.refreshControl = refreshControl
  }
  
  @objc func reloadData() {
    tableView.refreshControl?.endRefreshing()
    tableView.reloadData()
  }
  
  @objc func switchToEditing() {
    tableView.setEditing(!tableView.isEditing, animated: true)
  }
}

// MARK: - UITableViewDataSource

extension TableViewEditing: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    print("CellForRowAt :", indexPath)
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
    cell.textLabel?.text = "\(data[indexPath.row])"
    return cell
  }
  
  // trailingSwipeAction > commit EditingStyle
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    switch editingStyle {
    case .none:
      print("none")
    case .delete:
      print("delete")
      data.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .automatic)
    case .insert:
      // 1 ~ 50 사이의 숫자가 들어가도록
      print("inserted")
      data.insert((1...50).randomElement()!, at: indexPath.row)
      tableView.insertRows(at: [indexPath], with: .automatic)
    default: break
    }
  }

}


// MARK: - UITableViewDelegate

extension TableViewEditing: UITableViewDelegate {
  func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//    return .delete  // 기본값
//    return .insert
    
    let row = indexPath.row
    
    if row.isMultiple(of: 3) {
      return .none
    } else if row % 3 == 1 {
      return .delete
    } else {
      return .insert
    }
  }
  
  // trailingSwipeAction
//  func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//    let addAction = UIContextualAction(style: .normal, title: "ADD") { (action, sourceView, actionPerformed) in
//      print("Add Action")
//      actionPerformed(true)
//    }
//    addAction.backgroundColor = .green
//
//    let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, actionPerformed) in
//      print("Delete Action")
//      actionPerformed(true)
//    }
//
//    let configuration = UISwipeActionsConfiguration(actions: [addAction, deleteAction])
//    configuration.performsFirstActionWithFullSwipe = false
//    return configuration
//  }
//
//  func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//    let addAction = UIContextualAction(style: .normal, title: "ADD") { (action, sourceView, actionPerformed) in
//      print("Add Action")
//      actionPerformed(true)
//    }
//    addAction.backgroundColor = .green
//
//    let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, actionPerformed) in
//      print("Delete Action")
//      actionPerformed(true)
//    }
//
//    let configuration = UISwipeActionsConfiguration(actions: [addAction, deleteAction])
//    configuration.performsFirstActionWithFullSwipe = false
//    return configuration
//  }
}

