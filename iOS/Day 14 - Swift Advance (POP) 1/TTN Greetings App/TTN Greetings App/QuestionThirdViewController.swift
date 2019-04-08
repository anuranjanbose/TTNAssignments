//
//  QuestionThirdViewController.swift
//  TTN Greetings App
//
//  Created by Anuranjan Bose on 08/04/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit

protocol ErrorProtocol: class {
    func textFieldValidate(textField: UITextField) throws -> String
}

extension ErrorProtocol where Self: UIViewController {
    func textFieldValidate(textField: UITextField) -> String{
        print(textField.text!)
        
        let stringFormat = "[A-Za-z]{1,}"
        let format = NSPredicate(format:"SELF MATCHES %@", stringFormat)
        let result = format.evaluate(with: textField.text!)
        if result == true {
            return "String is valid"
        }
        else {
            return "String is not valid"
        }
    }
}


class QuestionThirdViewController: UIViewController, ErrorProtocol {
    
    @IBOutlet weak var validStringLabelTextField: UITextField!
    @IBOutlet weak var toastLabel : UILabel!
    
    @IBAction func checkValidString() {
        toastLabel.displayToast(label: textFieldValidate(textField: validStringLabelTextField))
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
