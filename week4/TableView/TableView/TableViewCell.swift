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
    
    //這裡要設label本身之於superView 的 Constraint
  
    
   func configureLabel() {
    self.backgroundColor = .blue
    label.backgroundColor = .red
        let cellWidth = bounds.size.width
        let cellHeight = bounds.size.height
    
        label.frame = CGRect(x: 10, y: 0, width: cellWidth - 10, height: cellHeight)
        contentView.addSubview(label)
    }
}
