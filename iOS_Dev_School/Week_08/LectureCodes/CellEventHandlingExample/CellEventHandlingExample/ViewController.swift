//
//  ViewController.swift
//  CellEventHandlingExample
//
//  Created by giftbot on 2019/12/17.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  /***************************************************
   셀의 버튼을 누를 때마다 해당 버튼이 속한 셀의 숫자가 1씩 올라가도록 구현
   ***************************************************/
  
  let tableView = UITableView()
  var data = Array(1...50)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.frame = view.frame
    tableView.dataSource = self
    tableView.rowHeight = 60
    tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
    view.addSubview(tableView)
  }
  
  
  @objc private func didTapButton(_ sender: UIButton) {
    // 1) tag 사용 방법
//    let row = sender.tag
//    let indexPath = IndexPath(row: row, section: 0)
//
//    if let cell = tableView.cellForRow(at: indexPath) as? CustomCell {
//      let addedNumber = data[row] + 1
//      data[row] = addedNumber
//      cell.textLabel?.text = "\(addedNumber)"
//    }
    
    // 2) SuperView로 가져오기
//    if let cell = sender.superview?.superview as? CustomCell,
//      let row = tableView.indexPath(for: cell)?.row {
//
//      let addedNumber = data[row] + 1
//      data[row] = addedNumber
//      cell.textLabel?.text = "\(addedNumber)"
//    }
  }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
    
    
    // 1) 액션을 통한 처리 방법
    
    // 최초 생성 여부 구분
    if cell.textLabel?.text == nil {
      /***************************************************
       버튼에 다른 이름의 selector를 추가하면 여러 개가 함께 호출되지만
       동일한 이름의 selector를 추가하는 것은 중복 추가되지 않으므로
       반드시 최초 생성 여부를 구분할 필요는 없음.
       ***************************************************/
      cell.button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    }
    
    cell.button.tag = indexPath.row
    
    // 2) delegate를 사용하는 방법
//    cell.delegate = self

    cell.textLabel?.text = "\(data[indexPath.row])"
    return cell
  }
}


// MARK: - CustomCellDelegate

extension ViewController: CustomCellDelegate {
  
  // 2) Delegate 이용 방법
  
  func customCell(_ cell: CustomCell, selectedRow row: Int) {
    // 태그 사용하지 않을 때
//    guard let row = tableView.indexPath(for: cell)?.row else { return }
    
    let addedNumber = data[row] + 1
    data[row] = addedNumber
    cell.textLabel?.text = "\(addedNumber)"
  }
}


