//
//  SearchResultCollectionViewCell.swift
//  NewAppStore
//
//  Created by Тагай Абдылдаев on 15/3/23.
//

import UIKit

class SearchResultCollectionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Apps Name"
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Photo&Video"
        return label
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "9.2M"
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.widthAnchor.constraint(equalToConstant: 64).isActive = true
        button.layer.cornerRadius = 12
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let labelStackView = UIStackView(arrangedSubviews: [nameLabel,categoryLabel,ratingLabel])
        labelStackView.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [imageView, labelStackView, getButton])
        stackView.spacing = 12
        stackView.alignment = .center
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
