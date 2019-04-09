//  ViewController.swift
//  Recipe CoreData
//
//  Created by Anuranjan Bose on 07/04/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit
var emailText: String?

class LoginViewController : UIViewController ,UITextFieldDelegate, ToastMessage{
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
    
    @IBAction func LoginButton() {
        if emailIdTextField.text != "" && passwordTextField.text != "" {
            //Condition matches if user is already Logged in using UserDefaults
            if UserDefaults.standard.string(forKey: emailIdTextField.text!) == emailIdTextField.text {
                emailText = emailIdTextField.text
                let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
                let controller = storyBoard.instantiateViewController(withIdentifier: "RecipeTabBarcontroller")
                self.navigationController?.pushViewController(controller, animated: true)
            }
            else {
                //If logged out, user has to first register
                toastMessageLabel.toast(message: "Please enter correct Email-ID")
            }
        }
    }
    
    //Opens Sign Up View Controller
    @IBAction func signUpButton() {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "SignUpVc")
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

