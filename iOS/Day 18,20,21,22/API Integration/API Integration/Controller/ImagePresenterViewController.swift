//
//  ImagePresenterViewController.swift
//  API Integration
//
//  Created by Anuranjan Bose on 08/04/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit

class ImagePresenterViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var authorButton: UIButton!
    
    
    var openURL = ""
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onAuthorButtonClick() {
        UIApplication.shared.openURL(NSURL(string: openURL)! as URL)
    }

}
