//
//  ViewController.swift
//  URLAssignment
//
//  Created by Astrid on 2021/8/19.
//

import UIKit

class ViewController: UIViewController {
  
  private var dataManager = DataManager()
  
  private var stationView = View()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view = stationView
    dataManager.delegate = self
    dataManager.performRequest(to: StationDataAddress.r3)
  
  }
  
}
//MARK:- DataManagerDelegate

extension ViewController: DataManagerDelegate {
  
  func updateUI(with information: StationData) {
    DispatchQueue.main.async { [weak self] in
      guard let self = self else {return}
      self.stationView.stationIDLabel.text = information.stationID
      self.stationView.stationNameLabel.text = information.stationName
      self.stationView.addressLabel.text = information.stationAddress
    }
  }
  
  func failedWithError(error: Error) {
    print("error: \(error.localizedDescription)")
  }
  
}
