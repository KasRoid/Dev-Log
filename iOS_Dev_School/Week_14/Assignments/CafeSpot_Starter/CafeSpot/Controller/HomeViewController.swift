//
//  ViewController.swift
//  CafeSpot
//
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit
import MapKit

final class HomeViewController: UIViewController {
    
    
    // MARK: - Properties
    let searchBar = UISearchController(searchResultsController: nil)
    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        return UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    }()
    var filteredPlaces = [CafeList]()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        cafeBrain.parsingCafeData()
    }
    
    
    // MARK: - UI
    private func configureUI() {
        // NavigationController
        navigationController?.navigationBar.isHidden = false
        navigationItem.titleView = UIView()
        
        // Setup Methods
        setupCollectionView()
        setupSearchBar()
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.frame = view.frame
        collectionView.backgroundColor = .systemBackground
    }
    
    
    // MARK: - Private Methods
    private func setupSearchBar() {
        searchBar.searchResultsUpdater = self
        searchBar.obscuresBackgroundDuringPresentation = false
        searchBar.searchBar.placeholder = "Search Cafes"
        navigationItem.searchController = searchBar
        definesPresentationContext = true
    }
    
    private func searchBarIsEmpty() -> Bool {
        return searchBar.searchBar.text?.isEmpty ?? true
    }
    
    private func filteredContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredPlaces = cafeBrain.cafeList.filter {
            $0.title.lowercased().contains(searchText.lowercased())
        }
        collectionView.reloadData()
    }
    
    private func isFiltering() -> Bool {
        return searchBar.isActive && !searchBarIsEmpty()
    }
    
}


// MARK: - UISearchResultsUpdating
extension HomeViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filteredContentForSearchText(searchController.searchBar.text!)
    }
    
}


// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isFiltering() ? filteredPlaces.count : cafeBrain.cafeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell else { fatalError() }
        let cafe = isFiltering() ? filteredPlaces[indexPath.item] : cafeBrain.cafeList[indexPath.item]
        let title = cafe.title
        let description = cafe.description
        cell.imageView.image = UIImage(named: title)
        cell.titleLabel.text = title
        cell.detailLabel.text = description
        cell.backgroundColor = .systemBackground
        return cell
        
    }
    
}


// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextVC = DetailViewController()
        nextVC.imageTitle = cafeBrain.cafeList[indexPath.item].title
        nextVC.imageSubtitle = cafeBrain.cafeList[indexPath.item].description
        nextVC.location = cafeBrain.cafeList[indexPath.item].location
        navigationController?.pushViewController(nextVC, animated: true)
    }
}


// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionViewCellLayout.itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return collectionViewCellLayout.edgeInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return collectionViewCellLayout.spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return collectionViewCellLayout.spacing
    }
    
}

