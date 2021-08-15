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
    
    //如果segment value change 檢查 password是firstresponder的話 login = done/ signUp = next
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentControl.layer.borderWidth = 1.0
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
        segmentControl.selectedSegmentTintColor = .black
        segmentControl.selectedSegmentIndex = Mode.signUp.rawValue
        
        
        accountTextField.delegate = self
        passwordTextField.delegate = self
        checkTextField.delegate = self
    }
    
    @IBAction func switchSegmentControl(_ sender: UISegmentedControl) {
        
        if passwordTextField.isFirstResponder {
            switch sender.selectedSegmentIndex{
            case Mode.logIn.rawValue:
                passwordTextField.returnKeyType = .done
                
            default:
                passwordTextField.returnKeyType = .next
            }
        }
        
        switch sender.selectedSegmentIndex  {
        
        case Mode.logIn.rawValue:
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
    
    func loginOrSignIn(){
        switch segmentControl.selectedSegmentIndex {
        
        case Mode.signUp.rawValue:
            
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
            
        default:
            
            guard let account = accountTextField.text,
                  let passWord = passwordTextField.text else{ return }
            
            if account != Valid.account || passWord != Valid.password {
                popAlert(in: Status.invalidAccountPassword)
            }
        }
        
    }
    
    @IBAction func pressButton(_ sender: UIButton) {
        loginOrSignIn()
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch (textField,segmentControl.selectedSegmentIndex) {
        
        case (accountTextField, Mode.logIn.rawValue):
            passwordTextField.becomeFirstResponder()
            
        case (passwordTextField, Mode.logIn.rawValue):
            loginOrSignIn()
            
        case (accountTextField, Mode.signUp.rawValue):
            passwordTextField.becomeFirstResponder()
            
        case (passwordTextField, Mode.signUp.rawValue):
            checkTextField.becomeFirstResponder()
            
        case (checkTextField, _ ):
            loginOrSignIn()
            
        default:
            textField.resignFirstResponder()
        }
        
        return false
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch (textField,segmentControl.selectedSegmentIndex) {
        
        case (accountTextField, _) :
            passwordTextField.returnKeyType = .next
            
        case (passwordTextField, Mode.logIn.rawValue):
            passwordTextField.returnKeyType = .done
            
        case (passwordTextField, Mode.signUp.rawValue):
            passwordTextField.returnKeyType = .next
            
        case (checkTextField, _):
            checkTextField.returnKeyType = .done
            
        default:
            break
        }
    }
}











