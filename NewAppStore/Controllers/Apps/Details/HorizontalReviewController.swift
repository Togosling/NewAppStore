//
//  HorizontalReviewController.swift
//  NewAppStore
//
//  Created by Тагай Абдылдаев on 27/3/23.
//

import UIKit

class HorizontalReviewController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "cellId"
    
    var reviews: Review? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(ReviewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? ReviewCell else {return UICollectionViewCell()}
        let review = reviews?.feed.entry[indexPath.item]
        cell.titleLabel.text = review?.title.label
        cell.authorLabel.text = review?.author.name.label
        cell.bodyLabel.text = review?.content.label
        for (index,view) in cell.starsStackView.arrangedSubviews.enumerated() {
            if let intRating = Int(review?.rating.label ?? "0") {
                view.alpha = index >= intRating ? 0 : 1
            }
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviews?.feed.entry.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: view.frame.height)
    }
}
