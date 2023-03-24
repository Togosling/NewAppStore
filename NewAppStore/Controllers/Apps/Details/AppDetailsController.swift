//
//  AppDetailsController.swift
//  NewAppStore
//
//  Created by Тагай Абдылдаев on 24/3/23.
//

import UIKit

class AppDetailsController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
