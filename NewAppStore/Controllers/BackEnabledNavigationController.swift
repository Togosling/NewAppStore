//
//  BackEnabledNavigationController.swift
//  NewAppStore
//
//  Created by Тагай Абдылдаев on 4/4/23.
//

import UIKit

class BackEnabledNAvigationController: UINavigationController, UIGestureRecognizerDelegate {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.interactivePopGestureRecognizer?.delegate = self
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.viewControllers.count > 1
    }
}
