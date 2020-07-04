//
//  DominoViewController.swift
//  DominoUsingCollectionView
//
//  Created by Lee on 2020/06/30.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class DominoViewController: UIViewController {
  
  private var cachedOffset = [Int: CGPoint]()
  
  private let dominoTableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setNanigation()
    setUI()
    setConstraint()
  }
}



// MARK: - UI

extension DominoViewController {
  private func setNanigation() {
    navigationItem.title = "Domino's"
  }
  
  private func setUI() {
    view.backgroundColor = .systemBackground
    
    dominoTableView.separatorStyle = .none
    dominoTableView.dataSource = self
    dominoTableView.delegate = self
    dominoTableView.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.identifier)
    view.addSubview(dominoTableView)
  }
  
  private func setConstraint() {
    let guide = view.safeAreaLayoutGuide
    
    dominoTableView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      dominoTableView.topAnchor.constraint(equalTo: guide.topAnchor),
      dominoTableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      dominoTableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      dominoTableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
    ])
  }
}



// MARK: - UITableViewDataSource

extension DominoViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    dominoData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.identifier, for: indexPath) as? MenuTableViewCell else { fatalError() }
    
    cell.configure(dominoData[indexPath.row])
    
    return cell
  }
}



// MARK: - UITableViewDelegate

extension DominoViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    guard let cell = cell as? MenuTableViewCell else { return }
    cell.offset = cachedOffset[indexPath.row] ?? .zero
  }

  func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    guard let cell = cell as? MenuTableViewCell else { return }
    cachedOffset[indexPath.row] = cell.offset
  }
}
