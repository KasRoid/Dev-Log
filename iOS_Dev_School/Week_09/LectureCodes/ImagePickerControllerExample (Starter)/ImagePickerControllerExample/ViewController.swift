//
//  ViewController.swift
//  ImagePickerControllerExample
//
//  Created by giftbot on 2020. 6. 1..
//  Copyright © 2020년 giftbot. All rights reserved.
//
import MobileCoreServices
import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    
    private lazy var imagePicker: UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        return imagePicker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Action
    
    @IBAction private func pickImage(_ sender: Any) {
        print("\n---------- [ pickImage ] ----------\n")
        
        imagePicker.sourceType = .photoLibrary // 기본값은 .photoLibrary 로 되어있다.
//        imagePicker.mediaTypes = [kUTTypeImage, kUTTypeMovie] as [String]
        present(imagePicker, animated: true)
    }
    
    
    @IBAction private func takePicture(_ sender: Any) {
        
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
        imagePicker.sourceType = .camera
        
        print(imagePicker.mediaTypes) // ["public.image"]
        
        let mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)
        //        print(mediaTypes) // ["public.image", "public.move"]
        
        imagePicker.mediaTypes = mediaTypes ?? []
        imagePicker.mediaTypes = ["public.image", "public.movie"] as [String]
        
        // kUTTypeVideo - 영상만, microphone 이 필요없다.
        // kUTTypeMovie - 영상 + 소리
        imagePicker.mediaTypes = [kUTTypeImage, kUTTypeMovie] as [String]
        
        if UIImagePickerController.isFlashAvailable(for: .rear) {
            imagePicker.cameraFlashMode = .auto
        }
        
        present(imagePicker, animated: true)
        print("\n---------- [ takePicture ] ----------\n")
    }
    
    @IBAction private func takePictureWithDelay(_ sender: Any) {
        print("\n---------- [ takePictureWithDelay ] ----------\n")
        imagePicker.sourceType = .camera
        imagePicker.mediaTypes = [kUTTypeImage as String]
        
        //        present(imagePicker, animated: true, completion: nil)
        present(imagePicker, animated: true) {
            // 띄우자마자 촬영
//                        self.imagePicker.takePicture()
            
            // 2초 뒤 촬영
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.imagePicker.takePicture()
            }
        }
    }
    
    
    @IBAction private func recordingVideo(_ sender: Any) {
        print("\n---------- [ recordingVideo ] ----------\n")
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            return
        }
        imagePicker.sourceType = .camera
        imagePicker.mediaTypes = [kUTTypeMovie as String]
        //        imagePicker.mediaTypes = ["public.movie"] // 위와 동일
        imagePicker.cameraCaptureMode = .video // mediaTypes 가 여러개일 때 기본모드 선택
        guard UIImagePickerController.isCameraDeviceAvailable(.rear) else { return }
        imagePicker.cameraDevice = .rear // 카메라 전,후면 선택, 기본값은 .rear
        present(imagePicker, animated: true, completion: nil)
        
        //        imagePicker.startVideoCapture()
        //        imagePicker.stopVideoCapture()
        
        //        imagePicker.videoMaximumDuration = 60 // 기본 10분
        //        imagePicker.videoQuality = .typeHigh // 화질 설정, 기본 medium
    }
    
    @IBAction private func toggleAllowsEditing(_ sender: Any) {
        print("\n---------- [ toggleAllowsEditing ] ----------\n")
        
        imagePicker.allowsEditing.toggle() // 사진을 수정할 수 있게 한다.
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // didCancel 메소드는 구현을 하면 dismiss 도 직접 구현해야한다. Cancel 시 추가적인 작업이 필요하지 않으면 생략하면 된다.
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("imagePickerControllerDidCancel")
        picker.presentingViewController?.dismiss(animated: true)
    }
    
    // 유저가 이미지를 선택할 시 호출되는 함수. Cancel 시 추가적인 작업이 필요하지 않으면 생략하면 된다.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print(info)
        
        let mediaType = info[.mediaType] as! NSString
        if UTTypeEqual(mediaType, kUTTypeImage) {
            let originalImage = info[.originalImage] as! UIImage
            let editedImage = info[.editedImage] as? UIImage
            let selectedImage = editedImage ?? originalImage
            imageView.image = selectedImage
            
            // 카메라로 찍은 경우만 저장
            if picker.sourceType == .camera {
                UIImageWriteToSavedPhotosAlbum(selectedImage, nil, nil, nil)
            }
        }
        else if UTTypeEqual(mediaType, kUTTypeMovie) {
            if let mediaPath = (info[.mediaURL] as? NSURL)?.path,
                UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(mediaPath) {
                UISaveVideoAtPathToSavedPhotosAlbum(mediaPath, nil, nil, nil)
            }
        }
        
        picker.presentingViewController?.dismiss(animated: true)
    }
}
