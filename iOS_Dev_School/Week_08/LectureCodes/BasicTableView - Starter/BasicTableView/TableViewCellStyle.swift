//
//  TableViewCellStyle.swift
//  BasicTableView
//
//  Created by Giftbot on 2020/05/25.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class TableViewCellStyle: UIViewController {
    
    override var description: String { "TableView - CellStyle" }
    
    /***************************************************
     셀 스타일 4가지 (default, subtitle, value1, value2)
     ***************************************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tableView = UITableView(frame: view.frame)
        tableView.rowHeight = 70
        tableView.dataSource = self
        view.addSubview(tableView)
        
//        tableView.separatorStyle = .none // 셀을 나누는 줄을 없에기
//        tableView.separatorInset = .init(top: 0, left: 50, bottom: 0, right: 50) // 셀을 나누는 줄의 간격 수정
    }
}

// MARK: - UITableViewDataSource

extension TableViewCellStyle: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 재사용
        let cell: UITableViewCell
        
        if indexPath.row % 4 == 0 {
            // 셀 재사용 시도 후 없으면 생성
            cell = tableView.dequeueReusableCell(withIdentifier: "Default")
                ?? UITableViewCell(style: .default, reuseIdentifier: "Default")
        } else if indexPath.row % 4 == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: "Subtitle")
                ?? UITableViewCell(style: .subtitle, reuseIdentifier: "Subtitle")
        } else if indexPath.row % 4 == 2 {
            cell = tableView.dequeueReusableCell(withIdentifier: "Value1")
                ?? UITableViewCell(style: .value1, reuseIdentifier: "Value1")
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "Value2")
                ?? UITableViewCell(style: .value2, reuseIdentifier: "Value2")
        }
        
        // 공통 속성 세팅
        cell.textLabel?.text = "\(indexPath.row * 1000)"
        cell.detailTextLabel?.text = "ABCDE" // default 에서는 detailText 가 없다. Value1 에서는 우측에, Value2 타이틀 바로 옆에
        cell.imageView?.image = UIImage(named: "bear") // value 2는 imageView 를 쓸 수 없다.
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
}

