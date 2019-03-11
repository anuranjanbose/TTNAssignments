//
//  ViewController.swift
//  Sign Up
//
//  Created by Anuranjan Bose on 05/03/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
 
    
   
    @IBOutlet weak var privacyLabel: UILabel!
    @IBOutlet weak var privacySwitchOutlet: UISwitch!
    
    @IBOutlet weak var viewPicker: UIView!
    
    // Button to dismiss Date Picker View
    
    @IBAction func donePicker(_ sender: UIButton) {
        
        let selectedDate =  dateOfBirthPicker.date
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .medium
        
        let strdate = dateFormatter.string(from: selectedDate)
        
        dateOfBirthField.text = strdate
        
        viewPicker.isHidden = true
        submitButton.isHidden = false
        
    }
    
   // Button to dismiss Place Picker View
    @IBAction func donePlaceButton(_ sender: UIButton) {
        
        viewPlacePicker.isHidden = true
        submitButton.isHidden = false
        
        passwordField.becomeFirstResponder()
        
        
        
    }
    
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var placePicker: UIPickerView!
    @IBOutlet weak var viewPlacePicker: UIView!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var emailIdField: UITextField!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var dateOfBirthField: UITextField!
    @IBOutlet weak var dateOfBirthPicker: UIDatePicker!
    @IBOutlet weak var placeOfBirthField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    
    let cities : [String] = ["Delhi", "Bangalore", "Mumbai", "Chennai", "Kolkata","Ranchi","Bhopal","Gorakhpur","Lucknow", "Pune","Dhanbad", "Nagpur", "Agra","Kanpur"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.placePicker.delegate = self
        self.placePicker.dataSource = self
        
        // As view loads, User name field will be the first to respond
        userNameField.becomeFirstResponder()
        
        privacyLabel.text = "Private account"
        
     //   submitButton.isEnabled = false
    }

    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
  
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }
  
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        placeOfBirthField.text = cities[row]
    }
    
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == userNameField {
            emailIdField.becomeFirstResponder()
        }
        
        else if textField == emailIdField {
            phoneNumberField.becomeFirstResponder()
        }
        else if textField == phoneNumberField {
            phoneNumberField.resignFirstResponder()
        }
        else if textField == passwordField {
            passwordField.resignFirstResponder()
        }
        
        
        return true
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == dateOfBirthField {
            submitButton.isHidden = true
            dateOfBirthField.resignFirstResponder()
            viewPicker.isHidden = false
            
        }
        
        if textField == placeOfBirthField {
            submitButton.isHidden = true
            placeOfBirthField.resignFirstResponder()
            viewPlacePicker.isHidden = false
        }
        
        if textField == passwordField{
            submitButton.isEnabled = true
        }
    }
    
   @IBAction func privacyChangeSwitch() {
    
    if privacySwitchOutlet.isOn {
        privacyLabel.text = "Private account"
        print("Your account is Private")
    }
    else
    {
        privacyLabel.text = "Public account"
        print("Your account is Public")
    }
    }
    
    
   
}

