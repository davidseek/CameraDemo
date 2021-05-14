//
//  ViewController.swift
//  CameraDemo
//
//  Created by Seek, David on 5/14/21.
//  Copyright © 2021 Seek, David. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let provider = CameraProvider(delegate: self)

        do {
            let picker = try provider.getImagePicker(source: .photoLibrary)
            present(picker, animated: true)
        } catch {
            NSLog("Error: \(error.localizedDescription)")
        }
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = (
            info[UIImagePickerController.InfoKey.editedImage] as? UIImage ??
            info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        )
        picker.dismiss(animated: true, completion: nil)
    }
}
