//
//  TodayMultipleAppController.swift
//  NewAppStore
//
//  Created by Тагай Абдылдаев on 3/4/23.
//

import UIKit

class TodayMultipleAppController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    fileprivate let cellId = "cellId"
    var results = [FeedResult]()
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        collectionView.register(MultipleAppInnerCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.isScrollEnabled = false
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? MultipleAppInnerCell else {return UICollectionViewCell()}
        let result = results[indexPath.item]
        cell.nameLabel.text = result.name
        cell.companyLabel.text = result.artistName
        cell.iconImageView.sd_setImage(with: URL(string: result.artworkUrl100))
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return min(4, results.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: (view.frame.height - 48) / 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
