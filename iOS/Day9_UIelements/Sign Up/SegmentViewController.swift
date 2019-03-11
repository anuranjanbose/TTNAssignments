//
//  SegmentViewController.swift
//  Sign Up
//
//  Created by Anuranjan Bose on 11/03/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit

class SegmentViewController: UIViewController {

    
    
    @IBOutlet weak var designationSegment: UISegmentedControl!
    @IBOutlet weak var designationLabel: UILabel!
    
   
    
    @IBAction func segmentValueChang() {
        if designationSegment.selectedSegmentIndex == 0 {
            designationLabel.text = "Welcome Employee"
        }
        else
        {
            designationLabel.text = "Welcome Employer"
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if designationSegment.selectedSegmentIndex == 0 {
            designationLabel.text = "Welcome Employee"
        }
        else
        {
            designationLabel.text = "Welcome Employer"
        }
    }
    


}
