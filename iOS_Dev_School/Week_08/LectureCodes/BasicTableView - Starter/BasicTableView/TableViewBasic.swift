//
//  TableViewBasic.swift
//  BasicTableView
//
//  Created by Giftbot on 2020/05/25.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class TableViewBasic: UIViewController {
  
  override var description: String { "TableView - Basic" }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let tableView = UITableView(frame: view.frame)
    view.addSubview(tableView)
    
    tableView.dataSource = self
    
    // 타입자체를 넘겨줘는 경우 self 를 사용해야 한다.
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
  }
}

// MARK: UITableViewDataSource

extension TableViewBasic: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 // 리턴 생략 가능
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 1번 - 기본 셀 생성
//        let cell = UITableViewCell(style: .default, reuseIdentifier: "CellID")
//        cell.textLabel?.text = "\(indexPath.row)" // indexPath 안에는 몇번째 섹션인지 그리고 몇번째 row 인지의 정보가 들어있다.
//        return cell
        
        // 2번 - 셀 재사용
//        let cell: UITableViewCell
//        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "CellID") {
//            cell = reusableCell
//        }
//        else {
//            cell = UITableViewCell(style: .default, reuseIdentifier: "CellID")
//        }
//        cell.textLabel?.text = "\(indexPath.row)"
//        return cell
  
        // 3번 - 미리 셀을 등록
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}
