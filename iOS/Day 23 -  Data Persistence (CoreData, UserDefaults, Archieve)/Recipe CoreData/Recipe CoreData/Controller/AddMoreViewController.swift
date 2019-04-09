
//
//  AddMoreViewController.swift
//  Recipe CoreData
//
//  Created by Anuranjan Bose on 08/04/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//


import UIKit
import CoreData

class AddMoreViewController: UIViewController , SavingDataToDataBase {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var madeByTextField: UITextField!
    @IBOutlet weak var originTextField: UITextField!
    @IBOutlet weak var timeToPrepareTextField: UITextField!
    @IBOutlet weak var ingredientsTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var favouriteSwitch: UISwitch!
    @IBOutlet weak var cancelButton: UIButton!
    
    
    var favourite: Bool?
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        favouriteSwitch.isOn = true
        favourite = true
    }

    
    @IBAction func saveButtonAction() {
        addData(name: nameTextField.text!, origin: originTextField.text!, favorite: favourite!, timeToPrep: timeToPrepareTextField.text!, madeBy: madeByTextField.text!, ingrediant: ingredientsTextField.text!)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func favoriteSwitchAction() {
        if(favouriteSwitch.isOn) {
            favourite = true
        }
        else {
            favourite = false
        }
        
    }
    @IBAction func cancelButtonAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
}

