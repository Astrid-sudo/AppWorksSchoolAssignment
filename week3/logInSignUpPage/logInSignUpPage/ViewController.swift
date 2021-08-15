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
        
        self.view.endEditing(true)
        
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
    
    func loginCheck(){
        
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
        
        if account != Valid.account || password != Valid.password {
            popAlert(in: Status.invalidAccountPassword)
        }
    }
    
    func signUpCheck(){
        
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
    }
    
    @IBAction func pressButton(_ sender: UIButton) {
        
        switch segmentControl.selectedSegmentIndex{
        
        case Mode.logIn.rawValue:
            loginCheck()
            
        case Mode.signUp.rawValue:
            signUpCheck()
            
        default:
            break
            
        }
    }
}

//MARK:- extension ViewController: UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch (textField,segmentControl.selectedSegmentIndex) {
        
        case (accountTextField, Mode.logIn.rawValue):
            passwordTextField.becomeFirstResponder()
            
        case (passwordTextField, Mode.logIn.rawValue):
            loginCheck()
            
        case (accountTextField, Mode.signUp.rawValue):
            passwordTextField.becomeFirstResponder()
            
        case (passwordTextField, Mode.signUp.rawValue):
            checkTextField.becomeFirstResponder()
            
        case (checkTextField, _):
            signUpCheck()
            
        default:
            textField.resignFirstResponder()
        }
        
        return false
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch (textField,segmentControl.selectedSegmentIndex) {
        
        case (accountTextField, _) :
            accountTextField.returnKeyType = .next
            
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











