//
//  ViewController.swift
//  URLAssignment
//
//  Created by Astrid on 2021/8/19.
//

import UIKit

class ViewController: UIViewController {
    // 做一個view 把label都放上去
    //再調整他們的constraints
    
    private enum Metrics {
      static let padding: CGFloat = 15.0
    }
    
    var dataManager = DataManager()
//    
//    @IBOutlet weak var stationIDLabel: UILabel!
//    @IBOutlet weak var stationNameLabel: UILabel!
//    @IBOutlet weak var addressLabel: UILabel!
    
    
    private var allConstraints: [NSLayoutConstraint] = []
         var stationIDLabel: UILabel = {
            let label = UILabel()
            label.textColor = .white
            label.font = .systemFont(ofSize: 30)
            return label
        }()

         var stationNameLabel: UILabel = {
            let label = UILabel()
            label.textColor = .white
            label.font = .systemFont(ofSize: 80, weight: .thin)
            return label
        }()

         var addressLabel: UILabel = {
            let label = UILabel()
            label.textColor = .white
            label.font = .systemFont(ofSize: 18)
            label.numberOfLines = 0
            return label
        }()
    
    
    override func viewSafeAreaInsetsDidChange(){
        
        if !allConstraints.isEmpty {
          NSLayoutConstraint.deactivate(allConstraints)
          allConstraints.removeAll()
        }
        
        let newInsets = view.safeAreaInsets
        let leftMargin = newInsets.left > 0 ? newInsets.left : Metrics.padding
        let rightMargin = newInsets.right > 0 ? newInsets.right : Metrics.padding
        let topMargin = newInsets.top > 0 ? newInsets.top : Metrics.padding
        let bottomMargin = newInsets.bottom > 0 ? newInsets.bottom : Metrics.padding
        
        let metrics = [
          "horizontalPadding": Metrics.padding,
      
          "topMargin": topMargin,
          "bottomMargin": bottomMargin,
          "leftMargin": leftMargin,
          "rightMargin": rightMargin]
        
        let views: [String: Any] = [
            "stationIDLabel": stationIDLabel as Any,
            "stationNameLabel": stationNameLabel as Any,
            "addressLabel": addressLabel as Any,
            "view":view as Any
        ]
        
        
        let stationIDLabelVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:[stationIDLabel]-35-[stationNameLabel]",
            options: [.alignAllCenterX],
            metrics: nil,
            views: views)
        allConstraints += stationIDLabelVerticalConstraints
        
        
//        let stationNameLabelVerticalConstraints = stationNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100)
        let stationNameLabelVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:[stationIDLabel][view]",
            options: [.alignAllCenterX],
            metrics: nil,
            views: views)
        allConstraints += stationNameLabelVerticalConstraints
        
        let stationNameLabelHorizontalConstraints = stationNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        allConstraints += stationNameLabelHorizontalConstraints
        
        let addressLabelVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:[stationNameLabel][addressLabel]-200-|",
            options: [.alignAllCenterX],
            metrics: nil,
            views: views)
        allConstraints += addressLabelVerticalConstraints

        NSLayoutConstraint.activate(allConstraints)
//        NSLayoutConstraint.activate([stationNameLabelVerticalConstraints,stationNameLabelHorizontalConstraints])
        
    }
    
 //    ● StationID label: 35 from StationName label, center X as superview’s center X, font size 30
    //    ● StationName label: center Y 100 higher than superview’s center Y, center X as superview’s center X, font size 80
    //    ● Address label: center X as superview’s center X, 200 from superview’s bottom, font size 18
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stationIDLabel)
        view.addSubview(stationNameLabel)
        view.addSubview(addressLabel)
        stationIDLabel.translatesAutoresizingMaskIntoConstraints = false
        stationNameLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
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
