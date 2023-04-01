//
//  TodayMultipleAppCell.swift
//  NewAppStore
//
//  Created by Тагай Абдылдаев on 1/4/23.
//

import UIKit

class TodayMultipleAppCell: BaseCell{
    
    override var todayItem: TodayItem! {
        didSet {
            categoryLabel.text = todayItem.category
            titleLabel.text = todayItem.title
        }
    }
    
    let categoryLabel: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 28)
        label.numberOfLines = 2
        return label

    }()
    
    let multipleAppController = UIViewController()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        layer.cornerRadius = 16
        backgroundColor = .white
        clipsToBounds = true
        
        let stackView = UIStackView(arrangedSubviews: [categoryLabel, titleLabel, multipleAppController.view])
        stackView.axis = .vertical
        stackView.spacing = 12
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
