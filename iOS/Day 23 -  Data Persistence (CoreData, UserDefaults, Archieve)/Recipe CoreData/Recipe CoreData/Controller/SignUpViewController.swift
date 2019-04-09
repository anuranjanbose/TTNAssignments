//
//  SignUpViewController.swift
//  Recipe CoreData
//
//  Created by Anuranjan Bose on 07/04/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate, Loggable , ErrorDisplay, ToastMessage {
    func toast(message: String) {
        
    }
    
    @IBOutlet weak var emailIdTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var toastMessageLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        emailIdTextField.delegate = self
        passwordTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailIdTextField {
            do {
                _ = try validateEmailAdd(emailIdTextField!) //Validates Email ID(Reg ex)
            }
            catch {
                emailIdTextField.text = ""
                toastMessageLabel.toast(message: "Please enter valid email")
                
            }
        }
        else if textField == passwordTextField {
            do {
                _ = try validatePassword(passwordTextField) //Validates password
            }
            catch {
                passwordTextField.text = ""
                toastMessageLabel.toast(message: "Password must contain minimum 8 characters, which includes 1 capital, 1 special character")
            }
        }
    }
    
    @IBAction func signUpButton() {
        if emailIdTextField.text! != "" && passwordTextField.text! != "" {
        emailText = emailIdTextField.text!
            
        signIn(userId: emailIdTextField.text!, key: emailIdTextField.text!)
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "RecipeTabBarcontroller")
        self.navigationController?.pushViewController(controller, animated: true)
        }
        else {
            toastMessageLabel.toast(message: "Enter your Details first")
        }
    }
}
