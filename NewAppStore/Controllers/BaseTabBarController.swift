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
        
        viewControllers = [createNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon"),
                           createNavController(viewController: ApssController(), title: "Apps", imageName: "apps"),
                           createNavController(viewController: SearchController(), title: "Search", imageName: "search")]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = title
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }
    
}
