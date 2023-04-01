//
//  TodayController.swift
//  NewAppStore
//
//  Created by Тагай Абдылдаев on 29/3/23.
//

import UIKit

class TodayController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "cellId"
    
    let items = [
        TodayItem.init(category: "LIFE HACK", title: "Utilizing Your Time", image: UIImage(named: "garden") ?? UIImage(), description: "ll the tools and apps you need to intelligently organize your life the right way.", backgroundColor: .white, cellType: .single),
        TodayItem.init(category: "THE DAILY LIST", title: "Test-Drive These CarPlay Apps", image: UIImage(named: "garden") ?? UIImage(), description: "", backgroundColor: .white, cellType: .multiple),
        TodayItem.init(category: "HOLIDAYS", title: "Travel on a Budjet", image: UIImage(named: "holiday") ?? UIImage(), description: "Find out all you need to know on how to travel without packing everything!", backgroundColor: UIColor(red: 251/255, green: 246/255, blue: 185/255, alpha: 1), cellType: .single)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)

        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: TodayItem.CellType.single.rawValue)
        collectionView.register(TodayMultipleAppCell.self, forCellWithReuseIdentifier: TodayItem.CellType.multiple.rawValue)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellType = items[indexPath.item].cellType.rawValue
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType, for: indexPath) as? BaseCell else {return UICollectionViewCell()}
        cell.todayItem = items[indexPath.item]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 64, height: 500)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 32, left: 0, bottom: 32, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let fullScreenController = TodayAppFullScreenController()
        fullScreenController.todayItem = items[indexPath.row]
        present(fullScreenController, animated: true)

    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
