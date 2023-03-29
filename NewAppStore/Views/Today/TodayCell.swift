//
//  TodayCell.swift
//  NewAppStore
//
//  Created by Тагай Абдылдаев on 29/3/23.
//

import UIKit

class TodayCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
       let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 16
        
        imageView.image = UIImage(named: "garden")
        addSubview(imageView)
        imageView.centerInSuperview(size: .init(width: 250, height: 250))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
