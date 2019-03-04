//
//  ViewController.swift
//  Example
//
//  Created by Anuranjan Bose on 01/03/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var label2 : String = "Hello from VC1"
    
    @IBOutlet var label1 : UILabel!

    
    @IBOutlet var button : UIButton!
   
    
    @IBAction func moveToNextView(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller  = storyboard.instantiateViewController(withIdentifier: "ViewController2") as? ViewController2
        
        controller?.label = "Anuranjan"
        self.navigationController?.pushViewController(controller!, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //label1.text = "abc"
        self.title = "Root View Controller"
       
        

    }
    
   
}

