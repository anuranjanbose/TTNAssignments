//
//  ViewController3.swift
//  Example
//
//  Created by Anuranjan Bose on 01/03/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {
    

    
    @IBAction func goToVC4() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ViewController4")
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
    @IBAction func dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "View Controller 3"
        
    
        // Do any additional setup after loading the view.
    }
    

}
