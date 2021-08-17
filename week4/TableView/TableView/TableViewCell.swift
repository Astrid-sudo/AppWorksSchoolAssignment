//
//  TableViewCell.swift
//  TableView
//
//  Created by Astrid on 2021/8/17.
//

import UIKit

class TableViewCell: UITableViewCell {
    
   static let reuseIdentifier = String(describing: TableViewCell.self)
   
    let label = UILabel()
    
   func configureLabel() {
        let cellWidth = frame.size.width
        let cellHeight = frame.size.height
        label.frame = CGRect(x: 0, y: 0, width: cellWidth, height: cellHeight)
        contentView.addSubview(label)
    }
}
