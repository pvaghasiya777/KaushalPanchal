//
//  ImagepickerVC.swift
//  Day 1
//
//  Created by Captain on 11/07/20.
//  Copyright © 2020 Captain. All rights reserved.
//

import UIKit

class ImagepickerVC: UIViewController,UINavigationControllerDelegate
    
{
    //MARK:- IBOutlet
    @IBOutlet var img_view: UIImageView!
    @IBOutlet var btn_submit: UIButton!
    
    let imagepicker : UIImagePickerController = UIImagePickerController()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func btn_image_picker(_ sender: UIButton) {
        print("Submit button click")
        imagepicker.delegate = self
        imagepicker.isEditing = true
        imagepicker.allowsEditing = false
        
        let actionsheet = UIAlertController(title: "Profile Picture", message: "Choose your Profile Picture From the Following Option", preferredStyle: .actionSheet)
        let Gallary = UIAlertAction(title: "Gallery", style: .default, handler: {
            (_)in
            self.imagepicker.sourceType = .photoLibrary
            self.present(self.imagepicker, animated: true, completion: nil)
        })
        let Camera = UIAlertAction(title: "Camera", style: .default, handler: {
            (_)in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.imagepicker.sourceType = .camera
                self.present(self.imagepicker, animated: true, completion: nil)
            }else {
                let Alert = UIAlertController(title: "Camera Not Found", message: "Camera is not availabel", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: {(_)in})
                Alert.addAction(ok)
                self.present(Alert, animated: true, completion: nil)
            }
        })
        let Cancell = UIAlertAction(title: "Cancel", style: .cancel
            , handler: nil)
        actionsheet.addAction(Gallary)
        actionsheet.addAction(Camera)
        actionsheet.addAction(Cancell)
        self.present(actionsheet, animated: true, completion: nil)
    }
   
}
extension ImagepickerVC : UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.img_view.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
}

