//
//  MusicController.swift
//  NewAppStore
//
//  Created by Тагай Абдылдаев on 8/4/23.
//

import UIKit

class MusicController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "cellId"
    fileprivate let footerId = "footerId"
    
    var searchResult = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(MusicCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(MusicFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerId)
        
        fetchData()
    }
    
    fileprivate let searchTearm = "taylor"
    
    fileprivate func fetchData() {
        let urlString = "https://itunes.apple.com/search?term=taylor+swift&offset=0&limit=20"
        Service.shared.fetchSearchApp(urlString: urlString) { (result) in
            self.searchResult = result.results
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerId, for: indexPath) as! MusicFooter
        return footer
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 100)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchResult.count
    }
    
    var isPaginating = false
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MusicCell
        let track = searchResult[indexPath.item]
        cell.imageView.sd_setImage(with: URL(string: track.artworkUrl100))
        cell.nameLabel.text = track.trackName
        cell.descriptionLabel.text = "\(track.artistName ?? "") • \(track.collectionName ?? "")"
        
        if indexPath.item == searchResult.count - 1 && !isPaginating {
            self.isPaginating = true
            let urlString = "https://itunes.apple.com/search?term=taylor+swift&offset=\(searchResult.count)&limit=20"
            Service.shared.fetchGenericJsonData(urlString: urlString) { (searchResult: SearchResult?) in
                sleep(2)
                self.searchResult += searchResult?.results ?? []
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                self.isPaginating = false
            }
        }
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 100)
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
