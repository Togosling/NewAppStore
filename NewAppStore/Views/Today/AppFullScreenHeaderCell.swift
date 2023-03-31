//
//  AppFullScreenHeaderCell.swift
//  NewAppStore
//
//  Created by Тагай Абдылдаев on 31/3/23.
//

import UIKit

class AppFullScreenHeaderCell: UITableViewCell {
    
    let todayCell = TodayCell()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(todayCell)
        todayCell.fillSuperview()

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
