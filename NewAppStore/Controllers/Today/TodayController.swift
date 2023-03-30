//
//  TodayController.swift
//  NewAppStore
//
//  Created by Тагай Абдылдаев on 29/3/23.
//

import UIKit

class TodayController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "cellId"
    fileprivate var startingFrame: CGRect?
    fileprivate var fullScreenController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)

        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let fullScreenController = TodayAppFullScreenController()
        guard let fullScreenControllerView = fullScreenController.view else {return}
        
        view.addSubview(fullScreenControllerView)
        
        addChild(fullScreenController)
        self.fullScreenController = fullScreenController
        
        fullScreenControllerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
        guard let cell = collectionView.cellForItem(at: indexPath) else {return}
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else {return}
        self.startingFrame = startingFrame
        
        fullScreenControllerView.frame = startingFrame
        fullScreenControllerView.layer.cornerRadius = 16
        
        UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseOut) {
            fullScreenControllerView.frame = self.view.frame
            self.tabBarController?.tabBar.isHidden = true
        }
    }
    
    @objc func handleTap(gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseOut) {
            gesture.view?.frame = self.startingFrame ?? .zero
        } completion: { _ in
            gesture.view?.removeFromSuperview()
            self.tabBarController?.tabBar.isHidden = false
            self.fullScreenController?.removeFromParent()
        }

    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? TodayCell else {return UICollectionViewCell()}
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
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
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
