//
//  SegmentViewController.swift
//  Sign Up
//
//  Created by Anuranjan Bose on 11/03/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit

class SegmentViewController: UIViewController {

    @IBOutlet weak var jobTypeSegment: UISegmentedControl!
    @IBOutlet weak var jobTypeLabel: UILabel!

    @IBAction func jobTypeSegmentValueChange() {
        if let jobType = jobTypeSegment.titleForSegment(at: jobTypeSegment.selectedSegmentIndex) {
            jobTypeLabel.text = "Welcome \(jobType)"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        jobTypeSegmentValueChange()
    }
} // End of SegmentViewController
