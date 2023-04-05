//
//  BaseCell.swift
//  NewAppStore
//
//  Created by Тагай Абдылдаев on 1/4/23.
//

import UIKit

class BaseCell: UICollectionViewCell{
    
    var todayItem: TodayItem!
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        self.backgroundView = UIView()
        addSubview(backgroundView!)
        self.backgroundView?.fillSuperview()
        self.backgroundView?.backgroundColor = .white
        self.backgroundView?.layer.cornerRadius = 16
        
        
        self.backgroundView?.layer.shadowOpacity = 0.1
        self.backgroundView?.layer.shadowRadius = 10
        self.backgroundView?.layer.shadowOffset = .init(width: 0, height: 10)
        self.backgroundView?.layer.shouldRasterize = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
