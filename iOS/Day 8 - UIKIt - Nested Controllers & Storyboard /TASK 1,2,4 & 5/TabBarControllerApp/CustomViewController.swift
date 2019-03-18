//
//  CustomImageViewController.swift
//  TabBarControllerApp
//
//  Created by Anuranjan Bose on 18/03/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController {

    
    @IBOutlet weak var customView : UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.layer.cornerRadius = customView.frame.size.height/3
        customView.layer.shadowOffset = CGSize(width: 20, height: 20)
        customView.layer.shadowOpacity = 0.8
        customView.layer.shadowRadius = customView.frame.size.height/3
        customView.clipsToBounds = false
        customView.layer.masksToBounds = false
    }
}
