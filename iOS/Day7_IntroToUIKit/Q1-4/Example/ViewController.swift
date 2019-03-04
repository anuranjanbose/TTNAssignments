//
//  ViewController.swift
//  Example
//
//  Created by Anuranjan Bose on 01/03/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet var label1 : UILabel!

    
    @IBOutlet var button : UIButton!
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
    }
    
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
        print("ViewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("ViewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("ViewDidAppear")
    }
   
    override func viewWillDisappear(_ animated: Bool) {
        print("ViewWillDisappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        print("ViewDidDisappear")
    }
}

