//
//  ViewController2ViewController.swift
//  Example
//
//  Created by Anuranjan Bose on 01/03/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    var label : String = ""
    
    @IBAction func moveToVC3() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ViewController3")
        //self.navigationController?.pushViewController(controller, animated: true)
        self.present(controller, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ViewController2"
        print(label)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func pushVC3() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ViewController3")
        self.navigationController?.pushViewController(controller, animated: true)
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
