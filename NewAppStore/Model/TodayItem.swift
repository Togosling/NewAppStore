//
//  TodayItem.swift
//  NewAppStore
//
//  Created by Тагай Абдылдаев on 1/4/23.
//

import Foundation
import UIKit

struct TodayItem {
    
    let category: String
    let title: String
    let image: UIImage
    let description: String
    let backgroundColor: UIColor
    
//    let apps: [FeedResult]
    
    let cellType: CellType
    enum CellType: String {
        case multiple, single
    }
}
