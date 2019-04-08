//
//  FifthQuestionViewController.swift
//  TTN Greetings App
//
//  Created by Anuranjan Bose on 08/04/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit


protocol LoginProtocol {
    func userLogin(userName: String)
    func userLogout(userName: String)
}



class FifthQuestionViewController: UIViewController, LoginProtocol {

    func userLogin(userName: String) {
        UserDefaults.standard.set(userName, forKey: userName)
    }
    func userLogout(userName: String) {
        UserDefaults.standard.removeObject(forKey: userName)
    }
    
    
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var loginLabel: UILabel!
 
    
    @IBAction func logout(_ sender: Any) {
        userLogout(userName: usernameTextField.text!)
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func login(_ sender: Any) {
        userLogin(userName: usernameTextField.text!)
        let user = UserDefaults.standard.string(forKey: usernameTextField.text!)
        loginLabel.text = "Welcome! \(user!)"
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
