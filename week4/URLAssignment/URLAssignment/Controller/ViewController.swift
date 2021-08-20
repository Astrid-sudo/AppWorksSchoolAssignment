//
//  ViewController.swift
//  URLAssignment
//
//  Created by Astrid on 2021/8/19.
//

import UIKit

class ViewController: UIViewController {
    //Practice autolayout code
    
    var dataManager = DataManager()
    
    @IBOutlet weak var stationIDLabel: UILabel!
    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.delegate = self
        dataManager.performRequest(to:StationDataAddress.r3)
    }
}
//MARK:- DataManagerDelegate

extension ViewController: DataManagerDelegate {
    
    func updateUI(with information: StationData) {
        DispatchQueue.main.async {
            self.stationIDLabel.text = information.stationID
            self.stationNameLabel.text = information.stationName
            self.addressLabel.text = information.stationAddress
        }
    }
    
    func failedWithError(error: Error) {
        print("Parse JSON Failed: \(error.localizedDescription)")
    }
    
}
