//
//  AppsCollectionViewCell.swift
//  NewAppStore
//
//  Created by Тагай Абдылдаев on 18/3/23.
//

import UIKit

class AppsCollectionViewCell : UICollectionViewCell {
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "App Section"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    let horizontalController = AppsHorizontalController()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
        
        addSubview(horizontalController.view)
        horizontalController.view.backgroundColor = .blue
        horizontalController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
