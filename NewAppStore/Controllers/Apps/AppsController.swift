//
//  AppsController.swift
//  NewAppStore
//
//  Created by Тагай Абдылдаев on 18/3/23.
//

import UIKit

class ApssController : UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "id"
    fileprivate let headerId = "headerId"
    var appGroups = [AppGroup]()
    var socialApps = [SocialApp]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(AppsCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(AppHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        fetchData()
    }
    
    fileprivate func fetchData() {
        
        let dispatchGroup = DispatchGroup()
        
        var appGroup1: AppGroup?
        var appGroup2: AppGroup?
        var socialGroup = [SocialApp]()

        dispatchGroup.enter()
        Service.shared.fetchTopFree(completion: {result in
            dispatchGroup.leave()
            appGroup1 = result
        })
        
        dispatchGroup.enter()
        Service.shared.fetchTopPaid { result in
            dispatchGroup.leave()
            appGroup2 = result
        }
        
        dispatchGroup.enter()
        Service.shared.fetchSocialApp { result in
            dispatchGroup.leave()
            socialGroup = result
        }
        
        dispatchGroup.notify(queue: .main) {
            if let group = appGroup1 {
                self.appGroups.append(group)
            }
            if let group = appGroup2 {
                self.appGroups.append(group)
            }
            self.socialApps = socialGroup
            self.collectionView.reloadData()
        }
    }
    
    //MARK: HEADER
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as? AppHeader else {return UICollectionReusableView()}
        header.appHeaderHorizontalController.socialApps = socialApps
        header.appHeaderHorizontalController.collectionView.reloadData()
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    //MARK: CELL
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? AppsCollectionViewCell else {return UICollectionViewCell()}
        let appGroup = appGroups[indexPath.item]
        cell.titleLabel.text = appGroup.feed.title
        cell.horizontalController.appGroup = appGroup
        cell.horizontalController.collectionView.reloadData()
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
    
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
