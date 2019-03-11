//
//  DescViewController.swift
//  Sign Up
//
//  Created by Anuranjan Bose on 11/03/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit

class DescViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
    
    
    @IBOutlet weak var profilePicture: UIImageView!
    
    
    @IBOutlet weak var descField: UITextView!
    @IBAction func addImage(_ sender: UIButton) {
        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (alert:UIAlertAction!) -> Void in
            self.camera()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { (alert:UIAlertAction!) -> Void in
            self.photoLibrary()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func camera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self;
            myPickerController.sourceType = .camera
            self.present(myPickerController, animated: true, completion: nil)
        }
    }
    
    func photoLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self;
            myPickerController.sourceType = .photoLibrary
            self.present(myPickerController, animated: true, completion: nil)
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profilePicture.image = image
            
            
        }else{
            print("Couldn't upload image!")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        profilePicture.layer.borderWidth=1.0
        profilePicture.layer.masksToBounds = false
        profilePicture.layer.cornerRadius = profilePicture.frame.width/2
        profilePicture.clipsToBounds = true

        // Do any additional setup after loading the view.
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        descField.resignFirstResponder()
        return true
    }
    


}
