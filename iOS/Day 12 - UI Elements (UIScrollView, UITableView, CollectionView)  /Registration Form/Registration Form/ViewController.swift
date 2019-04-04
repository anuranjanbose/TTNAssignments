//
//  ViewController.swift
//  Registration Form
//
//  Created by Anuranjan Bose on 04/04/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userRecordTableView.dequeueReusableCell(withIdentifier: "userRecordTableViewCell") as! UserRecordTableViewCell
        cell.userAgeLabel.text = String(userDataArray[indexPath.row].userAge)
        cell.userContactNumberLabel.text = String(userDataArray[indexPath.row].userContactNumber)
        cell.userNameLabel.text = userDataArray[indexPath.row].userName
        cell.userProfilePictureImageView.image = userDataArray[indexPath.row].userProfilePicture
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    

    @IBAction func closeTableContainerViewButton(_ sender: UIButton) {
        tableContainerView.isHidden = true
        let image = UIImage(named: "userBlank")
        userProfilePictureImageView.image = image
        
        userNameTextField.text = ""
        addressTextField.text = ""
        contactNumberTextField.text = ""
        ageTextField.text = ""
        
        userNameTextField.becomeFirstResponder()
    }
    @IBOutlet weak var userProfilePictureImageView: UIImageView!
    @IBOutlet weak var userRecordTableView: UITableView!
    @IBOutlet weak var tableContainerView: UIView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var contactNumberTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBAction func submitButton(_ sender: UIButton) {
        if let userName = userNameTextField.text, let userAge = ageTextField.text, let userContactNumber = contactNumberTextField.text, let userAddress = addressTextField.text, let userProfilePicture = userProfilePictureImageView.image {
            if let userValidAge = Int(userAge), let userValidContactNumber = Int(userContactNumber) {
                userDataArray.append(User(userProfilePicture: userProfilePicture, userName: userName, userAge: userValidAge, userContactNumber: userValidContactNumber, userAddress: userAddress))
                tableContainerView.isHidden = false
                userRecordTableView.reloadData()
                self.view.bringSubviewToFront(tableContainerView)
            }
        }
    }
    
    struct User {
        let userProfilePicture: UIImage!
        let userName: String!
        let userAge: Int!
        let userContactNumber: Int!
        let userAddress: String!
    }
    
    
    var userDataArray = [User]()
    
    @IBAction func addImageButton() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self

        let selectPicture = UIAlertController(title: "Upload Image", message: "Select the Source", preferredStyle: .actionSheet)
        
        selectPicture.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action : UIAlertAction) in imagePickerController.sourceType = .camera
            self.present(selectPicture , animated: true, completion: nil)
        }))
        
        selectPicture.addAction(UIAlertAction(title: "Gallery", style: .default, handler: {(action : UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        selectPicture.addAction(UIAlertAction(title: "Cancel", style: .cancel , handler: nil))
        self.present(selectPicture, animated: true, completion: nil)

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        userProfilePictureImageView.image = pickedImage
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userRecordTableView.dataSource = self
        userRecordTableView.delegate = self
        let nib = UINib.init(nibName: "UserRecordTableViewCell", bundle: nil)
        userRecordTableView.register(nib, forCellReuseIdentifier: "userRecordTableViewCell")
        
        tableContainerView.isHidden = true
    }


}

