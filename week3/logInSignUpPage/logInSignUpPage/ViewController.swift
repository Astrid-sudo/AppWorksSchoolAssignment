//
//  ViewController.swift
//  logInSignUpPage
//
//  Created by Astrid on 2021/8/10.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkTextField: UITextField!
    @IBOutlet weak var checkLabel: UILabel!
    @IBAction func pressButton(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentControl.layer.borderWidth = 1.0
        segmentControl.layer.cornerRadius = 5.0
        segmentControl.layer.borderColor = UIColor.black.cgColor
        segmentControl.layer.masksToBounds = true
        segmentControl.backgroundColor = .white
        segmentControl.tintColor = .black
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: UIControl.State.normal)
        segmentControl.selectedSegmentTintColor = .black
        
        
    }
    
    
}

