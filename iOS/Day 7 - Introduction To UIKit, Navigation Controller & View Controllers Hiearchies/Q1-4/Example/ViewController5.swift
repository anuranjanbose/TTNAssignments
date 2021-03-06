//
//  ViewController5.swift
//  Example
//
//  Created by Anuranjan Bose on 04/03/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit

class ViewController5: UIViewController {
    
    var label5 : String = ""

    @IBOutlet weak var labelOutlet: UILabel!
    
    @IBOutlet weak var textFieldVC: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "View Controller 5"

        //Data from View Controller 1
        
        let navArray = self.navigationController?.viewControllers
        let obj = navArray![0] as? ViewController
        let str = obj?.label2
        print(str!)
        labelOutlet.text = str!
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func specificVC() {
        
        
        if let text = textFieldVC.text {
            let number = Int(text)
            
            if let no = number {
                
                
            let navArray = self.navigationController?.viewControllers
            let count = navArray?.count
                if no <= count! {
           
                self.navigationController?.popToViewController((navArray?[no-1])!, animated: true)
            }
            }
        }
       
    }
    
    @IBAction func rootVC() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    

}
