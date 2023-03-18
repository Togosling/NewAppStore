//
//  SearchController.swift
//  NewAppStore
//
//  Created by Тагай Абдылдаев on 15/3/23.
//

import UIKit
import SDWebImage

class SearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    fileprivate let cellId = "id"
    var appSearchResults = [Result]()
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(SearchResultCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        setupSearchBar()
        
    }
    
    fileprivate func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            Service.shared.fetchApps(searchItem: searchText) { result in
                self.appSearchResults = result
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        })
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? SearchResultCollectionViewCell else {return UICollectionViewCell()}
        cell.appResult = appSearchResults[indexPath.item]
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
