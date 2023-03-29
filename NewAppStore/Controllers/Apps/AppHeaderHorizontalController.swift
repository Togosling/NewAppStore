//
//  AppHeaderHorizontalController.swift
//  NewAppStore
//
//  Created by Тагай Абдылдаев on 20/3/23.
//

import UIKit

class AppHeaderHorizontalController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "cellId"
    var socialApps = [SocialApp]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(AppHeaderCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? AppHeaderCell else {return UICollectionViewCell()}
        let socialApp = socialApps[indexPath.item]
        cell.titleLabel.text = socialApp.tagline
        cell.companyLabel.text = socialApp.name
        cell.imageView.sd_setImage(with: URL(string:socialApp.imageUrl))
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return socialApps.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 44, height: view.frame.height)
    }
}
