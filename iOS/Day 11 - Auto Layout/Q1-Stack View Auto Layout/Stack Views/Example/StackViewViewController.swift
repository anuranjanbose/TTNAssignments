//
//  StackViewViewController.swift
//  Example
//
//  Created by Anuranjan Bose on 19/03/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit

class StackViewViewController: UIViewController {

    
    
    var viewHoldingStackView = UIStackView(arrangedSubviews: [])
    var firstHorizontalStackView = UIStackView(arrangedSubviews: [])
    var secondHorizontalStackView = UIStackView(arrangedSubviews: [])
    @IBOutlet weak var numberOfViewsTextField: UITextField!
    
    @IBAction func backButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func goButton() {
        let redView = UIView()
        redView.backgroundColor = UIColor.red
        
        let blueView = UIView()
        blueView.backgroundColor = UIColor.blue
        
        let yellowView = UIView()
        yellowView.backgroundColor = UIColor.yellow
        
        let blackView = UIView()
        blackView.backgroundColor = UIColor.black
        
        if let number = numberOfViewsTextField.text {
            switch number {
            case "1" : viewHoldingStackView = UIStackView(arrangedSubviews: [redView])
            case "2" : viewHoldingStackView = UIStackView(arrangedSubviews: [redView, blueView])
            case "3" : viewHoldingStackView = UIStackView(arrangedSubviews: [redView, blueView, yellowView])
            case "4" : firstHorizontalStackView = UIStackView(arrangedSubviews: [redView, blueView])
            secondHorizontalStackView = UIStackView(arrangedSubviews: [yellowView, blackView])
            
            firstHorizontalStackView.axis = .horizontal
            firstHorizontalStackView.distribution = .fillEqually
            view.addSubview(firstHorizontalStackView)
            
            firstHorizontalStackView.frame = CGRect(x: 0, y: 200, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height/2 - 200)
            
            secondHorizontalStackView.axis = .horizontal
            secondHorizontalStackView.distribution = .fillEqually
            view.addSubview(secondHorizontalStackView)
            
            secondHorizontalStackView.frame = CGRect(x: 0, y: 400, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height/2 - 200)
            
            viewHoldingStackView = UIStackView(arrangedSubviews: [firstHorizontalStackView, secondHorizontalStackView])
            default  : print("Default case")
            }
        }
        viewHoldingStackView.axis = .vertical
        viewHoldingStackView.distribution = .fillEqually
        view.addSubview(viewHoldingStackView)
        viewHoldingStackView.frame = CGRect(x: 0, y: 200, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 200)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}
