//
//  ViewController.swift
//  Location Services App
//
//  Created by Anuranjan Bose on 09/04/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var lotteryWonLabel: UILabel!
    
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    
    @IBOutlet weak var lotteryWonTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameLabel.text = NSLocalizedString("name", comment: "nameLabel")
        stateLabel.text = NSLocalizedString("state", comment: "stateLabel")
        countryLabel.text = NSLocalizedString("country", comment: "countryLabel")
        dateOfBirthLabel.text = NSLocalizedString("dateOfBirth", comment: "dateOfBirthLabel")
        lotteryWonLabel.text = NSLocalizedString("lotteryWon", comment: "lotteryWonLabel")
    }


}

