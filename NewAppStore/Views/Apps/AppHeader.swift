//
//  AppHeader.swift
//  NewAppStore
//
//  Created by Тагай Абдылдаев on 20/3/23.
//

import UIKit

class AppHeader: UICollectionReusableView {
    
    let appHeaderHorizontalController = AppHeaderHorizontalController()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        addSubview(appHeaderHorizontalController.view)
        appHeaderHorizontalController.view.fillSuperview()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
