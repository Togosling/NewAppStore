//
//  HorizontalSnappingController.swift
//  NewAppStore
//
//  Created by Тагай Абдылдаев on 23/3/23.
//

import UIKit

class HorizontalSnappingController: UICollectionViewController {
    
    init(){
        let layout = SnappingLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
        collectionView.decelerationRate = .fast
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
