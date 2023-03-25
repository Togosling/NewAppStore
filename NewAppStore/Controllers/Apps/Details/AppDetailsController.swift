//
//  AppDetailsController.swift
//  NewAppStore
//
//  Created by Тагай Абдылдаев on 24/3/23.
//

import UIKit

class AppDetailsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var app: Result?
    let cellId = "cellId"
    
    var appId: String! {
        didSet {
            let urlString = "https://itunes.apple.com/lookup?id=\(appId ?? "")"
            Service.shared.fetchGenericJsonData(urlString: urlString) { (result: SearchResult) in
                let app = result.results.first
                self.app = app
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(AppDetailsCell.self, forCellWithReuseIdentifier: cellId)
        
        navigationItem.largeTitleDisplayMode = .never
        
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? AppDetailsCell else {return UICollectionViewCell()}
        guard let app = app else {return UICollectionViewCell()}
        cell.app = app
     
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let dummyCell = AppDetailsCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
        guard let app = app else {return .zero}
        dummyCell.app = app
        
        dummyCell.layoutIfNeeded()
        let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
        
        return .init(width: view.frame.width, height: estimatedSize.height)
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
