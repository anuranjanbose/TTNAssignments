//
//  RoundImageViewController.swift
//  Example
//
//  Created by Anuranjan Bose on 13/03/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit

class RoundImageViewController: UIViewController {

    @IBOutlet weak var roundImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        roundImageView.layer.borderWidth = 2.0
        //roundImageView.layer.borderColor = UIColor.red as! CGColor
        roundImageView.layer.masksToBounds = false
        roundImageView.layer.cornerRadius = roundImageView.frame.size.width/2
        roundImageView.clipsToBounds = true
    }
}
