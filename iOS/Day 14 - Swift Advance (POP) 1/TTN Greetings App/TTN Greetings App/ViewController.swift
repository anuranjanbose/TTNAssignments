//
//  ViewController.swift
//  TTN Greetings App
//
//  Created by Anuranjan Bose on 05/04/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var dateLabel: UILabel!
    var date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(date.dateFormatChange())
        dateLabel.text = date.dateFormatChange()
    }
   


}

extension Date {
    func dateFormatChange() -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd/MM/yyyy"
        return dateFormat.string(from: self)
    }
}
