//
//  SeventhQuestionViewController.swift
//  TTN Greetings App
//
//  Created by Anuranjan Bose on 08/04/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit



protocol Validator {
    func emailValidator(email: String) -> Bool
    func passwordValidator(password: String) -> Bool
}

class SeventhQuestionViewController: UIViewController, Validator {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var toastLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBAction func submit() {
        if emailValidator(email: emailTextField.text!) && passwordValidator(password: passwordTextField.text!) {
            toastLabel.displayToast(label: "Valid Email ID and Password")
        } else {
            toastLabel.displayToast(label: "Invalid Email ID and Password")
        }
    }
    
    
    func emailValidator(email: String) -> Bool {
        let regularExpressionForEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let validEmail = NSPredicate(format: "SELF MATCHES[c] %@", regularExpressionForEmail)
        return validEmail.evaluate(with: email)
    }
    
    func passwordValidator(password: String) -> Bool {
        let regularExpressionForPassword = "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}"
        let validPassword = NSPredicate(format: "SELF MATCHES %@", regularExpressionForPassword)
        return validPassword.evaluate(with: password)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }


}
