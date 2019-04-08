//
//  FourthQuestionViewController.swift
//  TTN Greetings App
//
//  Created by Anuranjan Bose on 08/04/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit


protocol ActivityIndicator {
    var indicator: UIActivityIndicatorView {get}
    func showIndicator()
    func hideIndicator()
}

extension ActivityIndicator where Self: UIViewController {
    func showIndicator() {
        self.indicator.style = .gray
        self.indicator.frame = CGRect(x: 50, y:50, width: 100, height: 100)
        self.indicator.center = CGPoint(x: self.view.bounds.size.width / 2, y: self.view.bounds.height - 200 )
        self.view.addSubview(self.indicator)
        self.indicator.startAnimating()
    }
    
    func hideIndicator() {
        self.indicator.stopAnimating()
        self.indicator.removeFromSuperview()
    }
}
class FourthQuestionViewController: UIViewController, ActivityIndicator {
    var indicator =  UIActivityIndicatorView()
    
    @IBAction func showActivityIndicator() {
        showIndicator()
    }
    
    @IBAction func hideActivityIndicator() {
        hideIndicator()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
