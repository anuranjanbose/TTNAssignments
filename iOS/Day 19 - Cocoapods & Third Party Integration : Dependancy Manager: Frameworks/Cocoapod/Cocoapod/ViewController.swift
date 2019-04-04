//
//  ViewController.swift
//  Cocoapod
//
//  Created by Anuranjan Bose on 22/03/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit



import Alamofire
import ReachabilitySwift

func isInternetAvailable() -> String {
    let reachability: Reachability = Reachability(hostname: "www.google.com")!
    let networkStatus: Bool = reachability.isReachableViaWiFi
    if networkStatus == false {
        return "No internet Connection"
    } else {
        return "Internet connection OK"
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(isInternetAvailable())
        
    }
}

