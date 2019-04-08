//
//  SixthQuestionViewController.swift
//  TTN Greetings App
//
//  Created by Anuranjan Bose on 08/04/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit


protocol Roundable {
    func round(view: UIView)
}

protocol Bordable {
    func border(view: UIView)
}

class SixthQuestionViewController: UIViewController, Roundable, Bordable {
    
    
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var bottomImageView: UIImageView!
    
    
    func border(view: UIView) {
        view.layer.borderWidth = 5.0
    }
    
    func round(view: UIView) {
        view.clipsToBounds = true
        view.layer.cornerRadius = view.frame.size.height/2
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        round(view: topImageView)
        border(view: bottomImageView)

    }


}
