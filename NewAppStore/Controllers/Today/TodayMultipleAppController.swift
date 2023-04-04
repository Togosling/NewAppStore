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
        
        if mode == .small {
            collectionView.isScrollEnabled = false
        }
        
        collectionView.register(MultipleAppInnerCell.self, forCellWithReuseIdentifier: cellId)
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
        if mode == .fullScreen {
            return results.count
        }
        return min(4, results.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if mode == .fullScreen {
            return .init(top: 12, left: 24, bottom: 12, right: 24)
        }
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if mode == .fullScreen {
            return .init(width: view.frame.width - 48, height: 64)
        }
        return .init(width: view.frame.width, height: (view.frame.height - 48) / 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    fileprivate let mode: Mode
    
    enum Mode {
        case small, fullScreen
    }
    
    init(mode: Mode) {
        self.mode = mode
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
