//
//  ViewController.swift
//  ImagePicker
//
//  Created by apple on 14/02/19.
//  Copyright © 2019 iOSProofs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var imagePickerController = UIImagePickerController()
    
    @IBOutlet weak var imageHolder: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
    }

    @IBAction func showOptions(_ sender: Any) {
        let actionContoller = UIAlertController(title: "Choose Source", message: "Please select a source to upload image", preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
            self.imagePickerController.sourceType = .camera
            self.present(self.imagePickerController, animated: true, completion: nil)
        }
        
        let albumAction = UIAlertAction(title: "Gallery", style: .default) { (action) in
            self.imagePickerController.sourceType = .photoLibrary
            self.present(self.imagePickerController, animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
            
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            actionContoller.addAction(cameraAction)
        }
        actionContoller.addAction(albumAction)
        actionContoller.addAction(cancelAction)
        self.present(actionContoller, animated: true, completion: nil)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print(info[UIImagePickerController.InfoKey.originalImage] ?? "")
        
        imageHolder.image = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        
        self.dismiss(animated: true, completion: nil)
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}

