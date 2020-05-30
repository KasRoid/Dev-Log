//
//  DetailViewController.swift
//  Dominos11_Starter
//
//  Created by Lee on 2020/05/26.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var imageView = UIImageView()
    var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }() // quantityLabel, addButton, subtractButton 이 담긴 뷰 컨테이너
    var quantityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .darkGray
        label.layer.borderWidth = 0
        label.layer.borderColor = UIColor.lightGray.cgColor
        return label
    }()
    lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 30)
        button.backgroundColor = .white
        button.layer.borderWidth = 2.0
        button.layer.cornerRadius = 2.0
        button.addTarget(self, action: #selector(addButtonAction(_:)), for: .touchUpInside)
        return button
    }()
    lazy var subtractButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 30)
        button.backgroundColor = .white
        button.layer.borderWidth = 2.0
        button.layer.cornerRadius = 2.0
        button.addTarget(self, action: #selector(subtractButtonAction(_:)), for: .touchUpInside)
        return button
    }()
    var productViewControllerIndexPath: IndexPath = IndexPath(row: 0, section: 0)
    var key = "" // 메뉴의 카테고리가 저장되는 변수
    var numberOfProductsOnCart: Int = 0 {
        didSet {
            quantityLabel.text = String(numberOfProductsOnCart)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        autoLayout()
    }
    override func viewWillAppear(_ animated: Bool) {
        let nameOfCurrentProduct = products.productsDetail[key]![productViewControllerIndexPath.row]
        if let value = products.productsOnCart[key] {
            if let _ = value[nameOfCurrentProduct] {
                numberOfProductsOnCart = products.productsOnCart[key]![nameOfCurrentProduct]!
            }
        }
        else if products.needToReset {
            numberOfProductsOnCart = 0
            products.needToReset = false
        }
        quantityLabel.text = String(numberOfProductsOnCart)
    }
    func setupUI() {
        let nameOfCurrentProduct = products.productsDetail[key]![productViewControllerIndexPath.row]
        navigationItem.title = nameOfCurrentProduct
        imageView.image = UIImage(named: nameOfCurrentProduct)
        if let value = products.productsOnCart[key] {
            if let _ = value[nameOfCurrentProduct] {
                numberOfProductsOnCart = products.productsOnCart[key]![nameOfCurrentProduct]!
            }
        }
        quantityLabel.text = String(numberOfProductsOnCart)
    }
    
    func autoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        view.addSubview(imageView)
        view.addSubview(containerView)
        [quantityLabel, addButton, subtractButton].forEach() { containerView.addSubview($0) }
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 100).isActive = true
        imageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -120).isActive = true
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        containerView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 40).isActive = true
        containerView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -40).isActive = true
        containerView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -100).isActive = true
        
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        quantityLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        quantityLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 60).isActive = true
        quantityLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -60).isActive = true
        quantityLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        
        subtractButton.translatesAutoresizingMaskIntoConstraints = false
        subtractButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        subtractButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        subtractButton.trailingAnchor.constraint(equalTo: quantityLabel.leadingAnchor, constant: 0).isActive = true
        subtractButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        addButton.leadingAnchor.constraint(equalTo: quantityLabel.trailingAnchor, constant: 0).isActive = true
        addButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
        addButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
    }
    
    @objc func addButtonAction(_ sender: UIButton) {
        let nameOfCurrentProduct = products.productsDetail[key]![productViewControllerIndexPath.row]
        numberOfProductsOnCart += 1
        if let value = products.productsOnCart[key] {
            if value[nameOfCurrentProduct] != nil {
                products.productsOnCart[key]![nameOfCurrentProduct]! += 1
                products.addItemOnCart(nameOfCurrentProduct)
            }
            else {
                if products.productsOnCart[key] != nil {
                    products.productsOnCart[key]![nameOfCurrentProduct] = 1
                    products.addItemOnCart(nameOfCurrentProduct)
                }
            }
        }
        else {
            products.productsOnCart[key] = [nameOfCurrentProduct: 1]
            products.addItemOnCart(nameOfCurrentProduct)
        }
    }
    
    @objc func subtractButtonAction(_ sender: UIButton) {
        let nameOfCurrentProduct = products.productsDetail[key]![productViewControllerIndexPath.row]
        if numberOfProductsOnCart > 0 {
            numberOfProductsOnCart -= 1
            if let value = products.productsOnCart[key] { // 카테코리로 제품 및 수량 딕셔너리에 접근
                if value[nameOfCurrentProduct] != nil { // 제품명으로 수량에 접근했을 때 nil 이 아니라면...
                    products.productsOnCart[key]![nameOfCurrentProduct]! -= 1
                    products.removeItemOnCart(nameOfCurrentProduct)
                    if products.productsOnCart[key]![nameOfCurrentProduct]! == 0 {
                        products.removeItemOnCart(nameOfCurrentProduct)
                    }
                }
                else {
                    if products.productsOnCart[key] != nil {
                        products.productsOnCart[key]![nameOfCurrentProduct] = 0
                        if products.productsOnCart[key]![nameOfCurrentProduct]! == 0 {
                            products.removeItemOnCart(nameOfCurrentProduct)
                        }
                    }
                }
            }
            else {
                products.productsOnCart[key] = [nameOfCurrentProduct: 0]
                if products.productsOnCart[key]![nameOfCurrentProduct]! == 0 {
                    products.removeItemOnCart(nameOfCurrentProduct)
                }
            }
        }
    }
}

extension DetailViewController: ProductsViewControllerDelegate {
    func sendIndexPath(_ data: IndexPath, _ title: String) {
        productViewControllerIndexPath = data
        key = title
    }
    
}
