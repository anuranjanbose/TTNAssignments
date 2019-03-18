//
//  ViewController.swift
//  TabBarControllerApp
//
//  Created by Anuranjan Bose on 18/03/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let firstTabItem = storyboard.instantiateViewController(withIdentifier: "firstViewController")
        let secondTabItem = storyboard.instantiateViewController(withIdentifier: "secondViewController")
        let thirdTabItem = storyboard.instantiateViewController(withIdentifier: "thirdViewController")
        firstTabItem.tabBarItem = UITabBarItem(title: "First Tab", image: nil, tag: 0)
        secondTabItem.tabBarItem = UITabBarItem(title: "Second Tab", image: nil, tag: 1)
        thirdTabItem.tabBarItem = UITabBarItem(title: "Third Tab", image: nil, tag: 2)
        viewControllers = [firstTabItem, secondTabItem, thirdTabItem]
    }
}

