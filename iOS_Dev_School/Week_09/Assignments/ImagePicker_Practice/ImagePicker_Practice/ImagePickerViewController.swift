//
//  ImagePickerViewController.swift
//  ImagePicker_Practice
//
//  Created by Kas Song on 2020.06.02.
//  Copyright © 2020 Kas Song. All rights reserved.
//
import MobileCoreServices
import UIKit

class ImagePickerViewController: UIViewController {
    
    // MARK: - Properties
    let imagePicker = UIImagePickerController()
    let imageView = UIImageView()
    var buttonTag = 0
    var buttonPressed = false
    var imagePickButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Image Pick", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 30)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 2.0
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        return button
    }()
    var leftArrowButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("<", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 35)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 2.0
        button.addTarget(self, action: #selector(leftArrowButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    var rightArrowButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(">", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 35)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 2.0
        button.addTarget(self, action: #selector(rightArrowButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    var leftArrowImageView = UIImageView()
    var rightArrowImageView = UIImageView()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        let interaction = UIContextMenuInteraction(delegate: self)
        let leftArrowInteraction = UIContextMenuInteraction(delegate: self)
        let rightArrowInteraction = UIContextMenuInteraction(delegate: self)
        imageView.addInteraction(interaction)
        imageView.isUserInteractionEnabled = true // 기본값이 비활성화라 활성화를 해주어야 한다.
        leftArrowButton.addInteraction(leftArrowInteraction)
        leftArrowButton.isUserInteractionEnabled = true
        rightArrowButton.addInteraction(rightArrowInteraction)
        rightArrowButton.isUserInteractionEnabled = true
        imagePicker.delegate = self
        setupUI()
    }
    
    // MARK: - UI
    func setupUI() {
        imageView.backgroundColor = .clear
        imageView.layer.cornerRadius = 20
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.gray.cgColor
        [imageView, imagePickButton, leftArrowButton, rightArrowButton, leftArrowImageView, rightArrowImageView].forEach() { view.addSubview($0) }
        [imageView, imagePickButton, leftArrowButton, rightArrowButton].forEach() { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            imageView.bottomAnchor.constraint(equalTo: imagePickButton.topAnchor, constant: -40),
            
            imagePickButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            imagePickButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -180),
            
            leftArrowButton.trailingAnchor.constraint(equalTo: imagePickButton.leadingAnchor, constant: -20),
            leftArrowButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -180),
            
            rightArrowButton.leadingAnchor.constraint(equalTo: imagePickButton.trailingAnchor, constant: 20),
            rightArrowButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -180)
        ])
    }
    
    
    // MARK: - Selectors
    @objc func buttonPressed(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary // 기본값은 .photoLibrary 로 되어있다.
        imagePicker.mediaTypes = [kUTTypeImage, kUTTypeMovie] as [String]
        present(imagePicker, animated: true)
    }
    
    @objc func leftArrowButtonPressed(_ sender: UIButton) {
        buttonTag = 1
        buttonPressed = true
    }
    @objc func rightArrowButtonPressed(_ sender: UIButton) {
        buttonTag = 2
        buttonPressed = true
    }
}


// MARK: - Extensions
extension ImagePickerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.presentingViewController?.dismiss(animated: true, completion: nil)
        
        let originalImage = info[.originalImage] as! UIImage
        imageView.image = originalImage
        picker.presentingViewController?.dismiss(animated: true)
    }
}

extension ImagePickerViewController: UIContextMenuInteractionDelegate {
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            let pickImage = UIAction(
                title: "Pick Image",
                image: UIImage(systemName: "photo"))
            { _ in
                print("Pick Image")
                self.present(self.imagePicker, animated: true)
            }
            
            let isAllowedEditing = self.imagePicker.allowsEditing
            
            let toggleEditing = UIAction(
                title: "Toggle Editing",
                image: UIImage(systemName: "repeat"),
                attributes: [.destructive],
                state: isAllowedEditing ? .on : .off)
            { _ in
                print("Toggle Editing")
                self.imagePicker.allowsEditing.toggle()
            }
            
            let submenu = UIMenu(
                title: "Submenu",
                image: UIImage(systemName: "list.number"),
                options: [.displayInline],
                children: [toggleEditing]
            )
            
            return UIMenu(
                title: "ContextMenu",
                children: [pickImage, submenu])
        }
    }
    
    // 프리뷰를 눌렀을 때 닫히게 된다. 프리뷰를 눌렀을 때 특정 동작이 실행되도록 할 수도 있다. UI작업은 시점이 맞지 않는듯?
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionCommitAnimating) {
    }
    
    // 원하는 뷰를 타겟 프리뷰로 지정
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, previewForHighlightingMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
        if buttonPressed {
            buttonPressed = false
            if buttonTag == 1 {
                return UITargetedPreview(view: self.leftArrowImageView)
            }
            else {
                return UITargetedPreview(view: self.rightArrowImageView)
            }
        }
        else {
            return UITargetedPreview(view: self.imageView)
        }
    }
    
    // Interaction 이 종료되기 전에 호출
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, willEndFor configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionAnimating?) {
    }
}
