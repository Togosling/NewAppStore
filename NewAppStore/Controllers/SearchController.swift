//
//  SearchController.swift
//  NewAppStore
//
//  Created by Тагай Абдылдаев on 15/3/23.
//

import UIKit

class SearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "id"
    var appSearchResults = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(SearchResultCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        fetchItunesApps()
    }
    
    fileprivate func fetchItunesApps() {
        Service.shared.fetchApps { result in
            self.appSearchResults = result
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }

    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? SearchResultCollectionViewCell else {return UICollectionViewCell()}
        let appSearchResult = appSearchResults[indexPath.item]
        cell.nameLabel.text = appSearchResult.trackName
        cell.categoryLabel.text = appSearchResult.primaryGenreName
        cell.ratingLabel.text = "Rating:\(Int(appSearchResult.averageUserRating ?? 0))"
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appSearchResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
