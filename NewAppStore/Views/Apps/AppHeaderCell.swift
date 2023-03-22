//
//  AppHeaderCell.swift
//  NewAppStore
//
//  Created by Тагай Абдылдаев on 20/3/23.
//

import UIKit

class AppHeaderCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Keeping up with friends is faster than ever"
        label.font = .systemFont(ofSize: 24)
        label.numberOfLines = 2
        return label
    }()
    
    let companyLabel: UILabel = {
        let label = UILabel()
        label.text = "Facebook"
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .blue
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        let overAllStackView = UIStackView(arrangedSubviews: [companyLabel, titleLabel, imageView])
        overAllStackView.axis = .vertical
        overAllStackView.spacing = 12
        
        addSubview(overAllStackView)
        overAllStackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
