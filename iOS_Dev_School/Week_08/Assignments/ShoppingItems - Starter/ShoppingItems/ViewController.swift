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
    
    var itemTitle: Array<String> = []
    var itemsInStock = [
        "iPhone7": ["iPhone8", "0", "10"],
        "iPhone8": ["iPhone8", "0", "10"],
        "iPhoneSE_Gold": ["iPhoneSE_Gold", "0", "8"],
        "iPhoneSE_RoseGold": ["iPhoneSE_RoseGold", "0", "8"],
        "iPhoneX_SpaceGray": ["iPhoneX_SpaceGray", "0", "5"],
        "iPhoneX_White": ["iPhoneX_White", "0", "5"],
        "iPhoneXs_SpaceGray": ["iPhoneX_SpaceGray", "0", "5"],
        "iPhoneXs_White": ["iPhoneX_White", "0", "5"],
        "iPhoneSE2": ["iPhone8", "0", "10"],
        "iPhone11_SpaceGray": ["iPhoneX_SpaceGray", "0", "5"],
        "iPhone11_White": ["iPhoneX_White", "0", "5"],
        "iPhone11Pro_SpaceGray": ["iPhoneX_SpaceGray", "0", "5"],
        "iPhone11Pro_White": ["iPhoneX_White", "0", "5"]
    ]
    var buttonTag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        for keys in itemsInStock.keys.sorted() {
            itemTitle.append(keys)
        }
        tableView.dataSource = self
        tableView.register(ItemCell.self, forCellReuseIdentifier: "ItemCell")
        tableView.frame = view.frame
        tableView.rowHeight = 80
        view.addSubview(tableView)
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.delegate = self
        let nameOfProducts = itemTitle[indexPath.row] // 제품명
        let imageOfProducts = itemsInStock[nameOfProducts]![0]
        let quantityOfProducts = String(itemsInStock[nameOfProducts]![1])
        cell.btnCount.tag = indexPath.row
        
        cell.imageView?.image = UIImage(named: imageOfProducts)
        cell.textLabel?.text = nameOfProducts
        cell.countLabel.text = quantityOfProducts
        return cell
    }
}

extension ViewController: ItemCellDelegate {
    func sendButtonTag(_ data: Int) {
        buttonTag = data
        var quantityOfSelectedItem = Int(itemsInStock[itemTitle[buttonTag]]![1])! // 버튼 누른 제품의 갯수를 Int 로 변환하여 변수에 할당
        let maxQuantityOfSelectedItem = Int(itemsInStock[itemTitle[buttonTag]]![2])!
        if quantityOfSelectedItem < maxQuantityOfSelectedItem {
            quantityOfSelectedItem += 1
            itemsInStock[itemTitle[buttonTag]]![1] = String(quantityOfSelectedItem) // 딕셔너리값 수정
        }
        else {
            let indexPath: IndexPath = IndexPath(row: buttonTag, section: 0)
            let cell = tableView.cellForRow(at: indexPath)!
            UITableViewCell.animate(withDuration: 0.5, animations: { cell.backgroundColor = .red }) { _ in
                UITableView.animate(withDuration: 0.5) { cell.backgroundColor = .clear }
            }

            let alertController = UIAlertController(title: "수량 초과", message: "구매할 수 있는 최대수량을 초과하였습니다.", preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "확인", style: .cancel, handler: nil)
            alertController.addAction(confirmAction)
            present(alertController, animated: true)
        }
        print(itemsInStock[itemTitle[buttonTag]]![1])
        tableView.reloadData()
    }
}
