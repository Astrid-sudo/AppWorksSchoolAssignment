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
    //    鍵盤之後再處理
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func switchSegmentControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            checkLabel.textColor = .gray
            checkTextField.isEnabled = false
            checkTextField.backgroundColor = .darkGray
        } else {
            checkLabel.textColor = .black
            checkTextField.isEnabled = true
            checkTextField.backgroundColor = .white
            
        }
    }
    
    
    func popAlert(in status: Status){
        let alert = UIAlertController(title: "Error", message: status.rawValue, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { [self]_ in
            accountTextField.text = ""
            passwordTextField.text = ""
            checkTextField.text = ""
        })
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func pressButton(_ sender: UIButton) {
        
//                sign up狀態
        
        if  segmentControl.selectedSegmentIndex == 1 {
            
            //        sign up account empty
            guard  accountTextField.text != "" else{
                popAlert(in: Status.accountEmpty)
                return
            }
            
            //        sign up  password empty
            guard let password =  passwordTextField.text else{ return}
            if password == ""{
                popAlert(in: Status.passwordEmpty)
            }
            
            //        sign up check password empty
            guard let check =  checkTextField.text else{return }
            if check == "" {
                popAlert(in: Status.checkEmpty)
            
            //            check password
            } else if check != password{
                popAlert(in: Status.passwordNotEqualToCheck)
            }
//             log in狀態
        } else {
            
            //invalid account,password
            guard let account = accountTextField.text,
                  let passWord = passwordTextField.text else{return}
            
            if account != Valid.account || passWord != Valid.password {
                popAlert(in: Status.invalidAccountPassword)
            }
        }
    }
}

