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
        segmentControl.selectedSegmentIndex = Mode.signUp.rawValue
        
        accountTextField.delegate = self
        passwordTextField.delegate = self
        checkTextField.delegate = self
    }
    
    @IBAction func switchSegmentControl(_ sender: UISegmentedControl) {
        
        textFieldDidBeginEditing(passwordTextField)
        
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
        
        switch textField {
        
        //登入 帳號
        case accountTextField  where segmentControl.selectedSegmentIndex == Mode.logIn.rawValue:
            passwordTextField.becomeFirstResponder()
            
        //登入 密碼
        case passwordTextField where segmentControl.selectedSegmentIndex == Mode.logIn.rawValue:
            loginOrSignIn()
            
        //註冊 帳號
        case accountTextField  where segmentControl.selectedSegmentIndex == Mode.signUp.rawValue:
            passwordTextField.becomeFirstResponder()
            
        //註冊 密碼
        case passwordTextField where segmentControl.selectedSegmentIndex == Mode.signUp.rawValue:
            checkTextField.becomeFirstResponder()
            
        case checkTextField:
            loginOrSignIn()
            
        default:
            textField.resignFirstResponder()
        }
        
        return false
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        
        case accountTextField:
            passwordTextField.returnKeyType = .next
            
        case passwordTextField where segmentControl.selectedSegmentIndex == Mode.logIn.rawValue:
            passwordTextField.returnKeyType = .done
            
        case passwordTextField where segmentControl.selectedSegmentIndex == Mode.signUp.rawValue:
            passwordTextField.returnKeyType = .next
            
        case checkLabel:
            passwordTextField.returnKeyType = .done
            
        default:
            break
        }
    }
}











