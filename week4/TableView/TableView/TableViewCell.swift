//
//  TableViewCell.swift
//  TableView
//
//  Created by Astrid on 2021/8/17.
//

import UIKit

class TableViewCell: UITableViewCell {
  
  static let reuseIdentifier = String(describing: TableViewCell.self)
  
  lazy var label: UILabel = {
    let label = UILabel()
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupLabel()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupLabel(){
    let padding : CGFloat = 10
    contentView.addSubview(label)
    label.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
      label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
      label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding/2),
      label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding/2),
      label.heightAnchor.constraint(greaterThanOrEqualToConstant: 101)
    ])
  }
}
