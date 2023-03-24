//
//  AppDetailsController.swift
//  NewAppStore
//
//  Created by Тагай Абдылдаев on 24/3/23.
//

import UIKit

class AppDetailsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var appId: String! {
        didSet {
            let urlString = "https://itunes.apple.com/lookup?id=\(appId ?? "")"
            Service.shared.fetchGenericJsonData(urlString: urlString) { (result: SearchResult) in
                print(result.results.first?.formattedPrice)
            }
        }
    }
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(AppDetailsCell.self, forCellWithReuseIdentifier: cellId)
        
        navigationItem.largeTitleDisplayMode = .never
        
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? AppDetailsCell else {return UICollectionViewCell()}
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
