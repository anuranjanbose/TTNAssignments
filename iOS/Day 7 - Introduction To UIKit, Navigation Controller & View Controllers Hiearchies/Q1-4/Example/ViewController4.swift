//
//  ViewController4.swift
//  Example
//
//  Created by Anuranjan Bose on 04/03/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit

class ViewController4: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "View Controller 4"
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func goToVC5() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ViewController5")
        self.navigationController?.pushViewController(controller, animated: true)
    }

  

}
