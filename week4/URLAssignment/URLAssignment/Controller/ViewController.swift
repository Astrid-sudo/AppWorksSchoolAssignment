//
//  ViewController.swift
//  URLAssignment
//
//  Created by Astrid on 2021/8/19.
//

import UIKit

class ViewController: UIViewController {
 
    var dataManager = DataManager()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "stationAppColor")
        setupLabels()
        dataManager.delegate = self
        dataManager.performRequest(to:StationDataAddress.r3)
    }
    
    private func setupLabels(){
        
        let safeArea = view.safeAreaLayoutGuide
        view.addSubview(stationIDLabel)
        view.addSubview(stationNameLabel)
        view.addSubview(addressLabel)
        stationIDLabel.translatesAutoresizingMaskIntoConstraints = false
        stationNameLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            stationIDLabel.topAnchor.constraint(greaterThanOrEqualTo: safeArea.topAnchor),
            stationIDLabel.bottomAnchor.constraint(equalTo: stationNameLabel.topAnchor,constant: -35),
            stationIDLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //大於等於 -100
            //            stationNameLabel.bottomAnchor.constraint(greaterThanOrEqualTo: view.centerYAnchor, constant: -100),
            stationNameLabel.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            stationNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            addressLabel.topAnchor.constraint(lessThanOrEqualTo: stationNameLabel.bottomAnchor, constant: 100),
            //大於等於 -200
            //            addressLabel.bottomAnchor.constraint(greaterThanOrEqualTo: view.bottomAnchor, constant: -200),
            addressLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            addressLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
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
