//
//  ViewController.swift
//  LoadMore
//
//  Created by Anuranjan Bose on 25/03/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit

protocol CapabaleToLoad {
    func loadData()
}
class ViewController: UIViewController, CapabaleToLoad, UIScrollViewDelegate {
    func loadData() {
        print("Loading data, Please Wait...")
    }
    
    
    @IBOutlet weak var scrollViewDrag: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        loadData()
    }
}
