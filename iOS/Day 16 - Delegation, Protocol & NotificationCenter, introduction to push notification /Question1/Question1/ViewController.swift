//
//  ViewController.swift
//  Question1
//
//  Created by Anuranjan Bose on 26/03/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit

class ViewController: UIViewController , DictionaryPassable {
   
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var enterDetailsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onEnterDetailsTap(_ sender: Any) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "DictionaryPassControlViewController") as! DictionaryPassControlViewController
        controller.delegate = self
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func passDictionary(dictionary: [String : String]) {
        nameLabel.text = "Name : \(dictionary["Name"]!)"
        ageLabel.text = "Age : \(dictionary["Age"]!)"
        phoneLabel.text = "Phone Number : \(dictionary["PhoneNumber"]!)"
    }
}

