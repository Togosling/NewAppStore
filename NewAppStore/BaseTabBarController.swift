//
//  BaseTabBarController.swift
//  NewAppStore
//
//  Created by Тагай Абдылдаев on 14/3/23.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchViewController = UIViewController()
        searchViewController.view.backgroundColor = .white
        searchViewController.navigationItem.title = "Search"
        let searchNavViewController = UINavigationController(rootViewController: searchViewController)
        searchNavViewController.tabBarItem.title = "Search"
        searchNavViewController.tabBarItem.image = UIImage(named: "search")
        searchNavViewController.navigationBar.prefersLargeTitles = true
        
        let appsViewController = UIViewController()
        appsViewController.view.backgroundColor = .white
        appsViewController.navigationItem.title = "Apps"
        let appsNavViewController = UINavigationController(rootViewController: appsViewController)
        appsNavViewController.tabBarItem.title = "Apps"
        appsNavViewController.tabBarItem.image = UIImage(named: "apps")
        appsNavViewController.navigationBar.prefersLargeTitles = true
                
        viewControllers = [appsNavViewController,searchNavViewController]
    }
}
