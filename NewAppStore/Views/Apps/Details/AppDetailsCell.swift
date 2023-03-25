//
//  AppDetailsCell.swift
//  NewAppStore
//
//  Created by Тагай Абдылдаев on 24/3/23.
//

import UIKit

class AppDetailsCell: UICollectionViewCell {
    
    var app: Result! {
        didSet {
            nameLabel.text = app.trackName
            releaseNotesLabel.text = app.releaseNotes
            imageView.sd_setImage(with: URL(string: app.artworkUrl100))
            priceButton.setTitle(app.formattedPrice, for: .normal)
        }
    }
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.widthAnchor.constraint(equalToConstant: 140).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 140).isActive = true
        iv.layer.cornerRadius = 16
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24)
        label.numberOfLines = 2
        return label
    }()
    
    let whatsNewLabel: UILabel = {
        let label = UILabel()
        label.text = "Whats New"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    let releaseNotesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    let priceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("4.99$", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = .systemBlue
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 14
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        return button
    }()
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        let pricebuttonStackView = UIStackView(arrangedSubviews: [priceButton,UIView()])
        pricebuttonStackView.axis = .horizontal
        let labelsAndPriceStackView = UIStackView(arrangedSubviews: [nameLabel,pricebuttonStackView,UIView()])
        labelsAndPriceStackView.spacing = 12
        labelsAndPriceStackView.axis = .vertical
        let imageAndLabelStackView = UIStackView(arrangedSubviews: [imageView,labelsAndPriceStackView])
        imageAndLabelStackView.spacing = 20
        imageAndLabelStackView.axis = .horizontal
        
        let finalStackView = UIStackView(arrangedSubviews: [imageAndLabelStackView,whatsNewLabel,releaseNotesLabel])
        finalStackView.axis = .vertical
        finalStackView.spacing = 16
        
        addSubview(finalStackView)
        finalStackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
