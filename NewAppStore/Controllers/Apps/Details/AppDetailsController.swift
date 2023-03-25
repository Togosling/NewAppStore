//
//  AppDetailsController.swift
//  NewAppStore
//
//  Created by Тагай Абдылдаев on 24/3/23.
//

import UIKit

import UIKit

class AppDetailsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var app: Result?
    let cellId = "cellId"
    let previewCellId = "previewCellId"
    
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
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: previewCellId)
        
        navigationItem.largeTitleDisplayMode = .never
        
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? AppDetailsCell else {return UICollectionViewCell()}
            cell.nameLabel.text = app?.trackName
            cell.releaseNotesLabel.text = app?.releaseNotes
            cell.imageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
            cell.priceButton.setTitle(app?.formattedPrice, for: .normal)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: previewCellId, for: indexPath) as? PreviewCell else {return UICollectionViewCell()}
            cell.horizontalPreviewController.app = app
            return cell
        }
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            let dummyCell = AppDetailsCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
            dummyCell.nameLabel.text = app?.trackName
            dummyCell.releaseNotesLabel.text = app?.releaseNotes
            dummyCell.imageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
            dummyCell.priceButton.setTitle(app?.formattedPrice, for: .normal)
            
            dummyCell.layoutIfNeeded()
            let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
            
            return .init(width: view.frame.width, height: estimatedSize.height)
        } else {
            return .init(width: view.frame.width, height: 500)
        }
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
