//
//  QuestionSecondViewController.swift
//  TTN Greetings App
//
//  Created by Anuranjan Bose on 08/04/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit

protocol PresentToast {
    func displayToast(label: String)
}

class QuestionSecondViewController: UIViewController {
    
    @IBOutlet weak var toastLabel: UILabel!
    
    @IBAction func showToast() {
        toastLabel.displayToast(label: "Here goes nothing!")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 

}

extension UILabel: PresentToast {
    func displayToast(label: String) {
        self.isHidden = false
        self.backgroundColor = .cyan
        self.clipsToBounds = true
        self.text = label
        
        UIView.animate(withDuration: 3, delay: 3.0, options: .transitionFlipFromTop, animations: {self.alpha = 0.0}, completion: {(isCompleted) in })
    }
}
