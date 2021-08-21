//
//  Vuew.swift
//  URLAssignment
//
//  Created by Astrid on 2021/8/21.
//

import UIKit

class View: UIView {

  lazy var stationIDLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.font = .systemFont(ofSize: 30)
    return label
  }()
  
  lazy var stationNameLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.font = .systemFont(ofSize: 80, weight: .thin)
    return label
  }()
  
  lazy var addressLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.font = .systemFont(ofSize: 18)
    label.numberOfLines = 0
    return label
  }()
  
  
  init(){
    super.init(frame:.zero)
    backgroundColor = UIColor(named: "stationAppColor")
    setupStationNameLabel()
    setupStationIDLabel()
    setupAddressLabel()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupStationIDLabel() {
    
    addSubview(stationIDLabel)
    stationIDLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stationIDLabel.bottomAnchor.constraint(equalTo: stationNameLabel.topAnchor, constant: -35),
      stationIDLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
    ])
    
  }
  
  private func setupStationNameLabel() {
    
    addSubview(stationNameLabel)
    stationNameLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stationNameLabel.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -100),
      stationNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
    ])
    
  }
  
  private func setupAddressLabel() {
    
    addSubview(addressLabel)
    addressLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      addressLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -200),
      addressLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
    ])
    
  }
  
}
