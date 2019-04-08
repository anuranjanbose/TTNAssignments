//
//  SecondVC.swift
//  Question2
//
//  Created by Anuranjan Bose on 27/03/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

   
    @IBOutlet weak var messageTwoLabel: UILabel!
    @IBOutlet weak var nextTwoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: notificationIdentifier), object: nil, queue: nil, using: fetchData)
    
    }
    
    func fetchData(notification : Notification) {
        guard let name = notification.userInfo![1]
            else {
                return
                    }
        messageTwoLabel.text = "Message came from third controller : \(name)"
        
    }
    
    @IBAction func onNext2Click(_ sender: Any) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "ThirdVC") as! ThirdVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
