//
//  PageViewController.swift
//  TabBarControllerApp
//
//  Created by Anuranjan Bose on 18/03/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {
 
    lazy var viewControllerList : [UIViewController] = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let firstViewController = storyboard.instantiateViewController(withIdentifier: "firstViewController")
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "secondViewController")
        let thirdViewController = storyboard.instantiateViewController(withIdentifier: "thirdViewController")
        return [firstViewController, secondViewController, thirdViewController]
    }()
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentViewControllerIndex = viewControllerList.index(of: viewController) else {
            return nil
        }
        let previousViewControllerIndex = currentViewControllerIndex - 1
        guard previousViewControllerIndex >= 0 else {
            return nil
        }
        guard viewControllerList.count > previousViewControllerIndex else {
            return nil
        }
        return viewControllerList[previousViewControllerIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentViewControllerIndex = viewControllerList.index(of: viewController) else {
            return nil
        }
        let nextViewControllerIndex = currentViewControllerIndex + 1
        guard viewControllerList.count != nextViewControllerIndex else {
            return nil
        }
        guard viewControllerList.count > nextViewControllerIndex else {
            return nil
        }
        return viewControllerList[nextViewControllerIndex]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        
        if let firstViewController = viewControllerList.first {
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
}
