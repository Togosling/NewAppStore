//
//  AppRowCell.swift
//  NewAppStore
//
//  Created by Тагай Абдылдаев on 20/3/23.
//

import UIKit

class AppRowCell: UICollectionViewCell {
    
    let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .purple
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "App Name"
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    let companyLabel: UILabel = {
        let label = UILabel()
        label.text = "Company Name"
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.layer.cornerRadius = 12
        return button
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        let verticalStackView = UIStackView(arrangedSubviews: [nameLabel,companyLabel])
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 4
        
        let overallStackView = UIStackView(arrangedSubviews: [iconImageView,verticalStackView,getButton])
        overallStackView.spacing = 16
        overallStackView.axis = .horizontal
        overallStackView.alignment = .center
        
        addSubview(overallStackView)
        overallStackView.fillSuperview()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
