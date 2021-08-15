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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentControl.layer.borderWidth = 1.0
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
        segmentControl.selectedSegmentTintColor = .black
        segmentControl.selectedSegmentIndex = 1
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func switchSegmentControl(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex  {
        
        case 0:
            checkLabel.textColor = .gray
            checkTextField.isEnabled = false
            checkTextField.backgroundColor = .darkGray
            checkTextField.text = ""
        
        default:
            checkLabel.textColor = .black
            checkTextField.isEnabled = true
            checkTextField.backgroundColor = .white
        }
    }
    
    
    func popAlert(in status: Status){
        let alert = UIAlertController(title: "Error", message: status.rawValue, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func pressButton(_ sender: UIButton) {
        
        switch segmentControl.selectedSegmentIndex {
        
        case 1:
            
           guard let account = accountTextField.text,
                     account != "" else {
            popAlert(in: Status.accountEmpty)
            return
            }
         
            
            guard let password =  passwordTextField.text,
                      password != "" else {
                popAlert(in: Status.passwordEmpty)
                return
            }
           
            guard let check =  checkTextField.text,
                      check != ""  else {
                popAlert(in: Status.checkEmpty)
                return
           }
            
           if check != password{
                popAlert(in: Status.passwordNotEqualToCheck)
            }
            
            
//            guard let check =  checkTextField.text else{ return }
//            if check == "" {
//                popAlert(in: Status.checkEmpty)
//            } else if check != password{
//                popAlert(in: Status.passwordNotEqualToCheck)
//            }
            
     default:
            
        guard let account = accountTextField.text,
              let passWord = passwordTextField.text else{ return }
            
        if account != Valid.account || passWord != Valid.password {
                popAlert(in: Status.invalidAccountPassword)
            }
        }
    }
}

//guard let password =  passwordTextField.text else{ return }
//if password == ""{
//    popAlert(in: Status.passwordEmpty)
//}
//
//guard let check =  checkTextField.text else{ return }
//if check == "" {
//    popAlert(in: Status.checkEmpty)
//} else if check != password{
//    popAlert(in: Status.passwordNotEqualToCheck)
//}
