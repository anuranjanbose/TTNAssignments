//
//  ViewController3.swift
//  Example
//
//  Created by Anuranjan Bose on 01/03/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {
    
   //Popping out to specific View Controller
    @IBAction func popToViewController() {
        let navArray = self.navigationController?.viewControllers
        if navArray?[1] != nil {
        if let moveToVC = navArray![1] as? ViewController2{
            self.navigationController?.popToViewController(moveToVC, animated: true)
        }
        }
    }
    //Popping out to Root view Controller
    @IBAction func popToRootViewController() {
      
            self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    
    @IBAction func dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ViewController3"
        
    
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
