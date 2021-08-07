//
//  ViewController.swift
//  Simple App
//
//  Created by Astrid on 2021/8/5.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var middleLabel: UILabel!
    @IBOutlet weak var funFactButton: UIButton!
    
    var randomNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
  }
   
    @IBAction func pressFunFact(_ sender: UIButton) {
       update()
    }
    
   func update(){
      
    let newNumber = Int.random(in: 0 ..< Content.text.count)
        
        if newNumber != randomNumber {
            randomNumber = newNumber
        } else if newNumber == randomNumber && randomNumber < Content.text.count - 1
        {
            randomNumber = newNumber + 1
        } else {
            randomNumber = newNumber - 1
        }
        
       print("randomNumber:\(randomNumber)")
        
       
    view.backgroundColor = UIColor(hexString: Content.color[randomNumber])
    funFactButton.setTitleColor(UIColor(hexString: Content.color[randomNumber]), for: .normal)
    middleLabel.text = Content.text[randomNumber]
  }

}

