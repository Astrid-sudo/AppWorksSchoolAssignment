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
    
    //製作popAlert function，代入不同情況，會顯示不同message
    
    
    @IBAction func pressButton(_ sender: UIButton) {
        
//        sign up狀態
        
        if  segmentControl.selectedSegmentIndex == 1 {
        
//        sign up account empty
        guard  accountTextField.text != "" else{
            let alert = UIAlertController(title: "Error", message: "Account should not be empty.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        }
        
        //        sign up  password empty
        guard  passwordTextField.text != "" else{
            let alert = UIAlertController(title: "Error", message: "Password should not be empty.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        }
        
//        sign up check password empty
        guard  checkTextField.text != "" else{
            let alert = UIAlertController(title: "Error", message: "Check Password should not be empty.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        }
        } else { // log in狀態
            
            guard let account = accountTextField.text,
                  let passWord = passwordTextField.text else{return}
            
            if account != "appworksschool@gmail.com" || passWord != "1234" {
                let alert = UIAlertController(title: "Error", message: "Login fail.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            }
            
         
            
            
            
            
            
            
        }
        
        
      
      
    }
    
    
}

