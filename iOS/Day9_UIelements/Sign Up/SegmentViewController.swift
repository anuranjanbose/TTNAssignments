//
//  SegmentViewController.swift
//  Sign Up
//
//  Created by Anuranjan Bose on 11/03/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit

class SegmentViewController: UIViewController {

    let jobType : [String] = ["Employer", "Employee"]
    
    @IBOutlet weak var jobTypeSegment: UISegmentedControl!
    @IBOutlet weak var jobTypeLabel: UILabel!
    
    @IBAction func jobTypeSegmentValueChange() {
    jobTypeLabel.text = "Welcome \(jobType[jobTypeSegment.selectedSegmentIndex])"
      
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       jobTypeLabel.text = "Welcome \(jobType[jobTypeSegment.selectedSegmentIndex])"
    }
    
} // End of SegmentViewController
