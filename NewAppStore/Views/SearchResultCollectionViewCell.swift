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
        label.text = "App Name"
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos & Video"
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
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.layer.cornerRadius = 14
        return button
    }()
    
    lazy var screenShot1 = self.createScreenShotImageView()
    lazy var screenShot2 = self.createScreenShotImageView()
    lazy var screenShot3 = self.createScreenShotImageView()

    
    func createScreenShotImageView() -> UIImageView {
        let screenShotImageView = UIImageView()
        screenShotImageView.backgroundColor = .blue
        return screenShotImageView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let labelStackView = UIStackView(arrangedSubviews: [nameLabel,categoryLabel,ratingLabel])
        labelStackView.axis = .vertical
        
        let topStackView = UIStackView(arrangedSubviews: [imageView, labelStackView, getButton])
        topStackView.spacing = 12
        topStackView.alignment = .center
        
        let screenShotStackView = UIStackView(arrangedSubviews: [screenShot1,screenShot2,screenShot3])
        screenShotStackView.spacing = 12
        screenShotStackView.distribution = .fillEqually
        
        let overallStackView = UIStackView(arrangedSubviews: [topStackView, screenShotStackView])
        overallStackView.axis = .vertical
        overallStackView.spacing = 16
        
        addSubview(overallStackView)
        overallStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
