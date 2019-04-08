//
//  EigthQuestionViewController.swift
//  TTN Greetings App
//
//  Created by Anuranjan Bose on 08/04/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit


protocol Contactable {
    func fetchData()
}
extension Contactable {
    
    func fetchData(){
        
    }
    
}
struct Employee {
    var employeeId: String?
    var firstName: String?
    var lastName: String?
    var imageUser: UIImage?
    var userRole: String?
   
    var address: String?
    
}

var array = [Employee]()


class EigthQuestionViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
    @IBOutlet weak var addImageButton: UIButton!
    @IBOutlet weak var toastLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var roleTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var employeeIDTextField: UITextField!
    
    
    
  
    func appendInArray(){
        
        
        array.append(Employee(employeeId: employeeIDTextField?.text, firstName: firstNameTextField.text, lastName: lastNameTextField.text, imageUser: userImageView.image, userRole: roleTextField.text, address: addressTextField.text))
    }
    
    @IBAction func submitAction(_ sender: Any) {
        appendInArray()
        nextButton.isEnabled = true
    }
    
    
    @IBAction func addImage(_ sender: Any) {
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
            userImageView.image = image
            
            
        }else{
            print("Something went wrong")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func resetFunction(_ sender: Any) {
        addressTextField.text = ""
        roleTextField.text = ""
        lastNameTextField.text = ""
        firstNameTextField.text = ""
        employeeIDTextField.text = ""
        userImageView.image = UIImage(named: "user.png")
        nextButton.isEnabled = false
        
        
    }
    
    @IBAction func nextPage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "greetingVC")
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isEnabled = false

    }


}
