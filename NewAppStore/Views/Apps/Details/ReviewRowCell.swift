//
//  ReviewRowCell.swift
//  NewAppStore
//
//  Created by Тагай Абдылдаев on 27/3/23.
//

import UIKit

class ReviewRowCell: UICollectionViewCell {
    
    let horizontalController = HorizontalReviewController()
    let reviewLabel: UILabel = {
        let label = UILabel()
        label.text = "Reviews & Ratings"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        addSubview(horizontalController.view)
        addSubview(reviewLabel)
        reviewLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 16, left: 16, bottom: 0, right: 16))
        horizontalController.view.anchor(top: reviewLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
