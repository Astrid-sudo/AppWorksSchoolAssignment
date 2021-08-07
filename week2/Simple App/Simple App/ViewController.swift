//
//  ViewController.swift
//  Simple App
//
//  Created by Astrid on 2021/8/5.
//

import UIKit

class ViewController: UIViewController {
    
//    have to make it to MVC
    
    @IBOutlet weak var middleLabel: UILabel!
   
    var randomNumber = 0
    
    let text = [
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas tempus.",
        "Contrary to popular belief, Lorem Ipsum is not simply random text.",
        "Richard McClintock, a Latin professor at Hampden-Sydney College in ",
        "looked up one of the more obscure Latin words, consectetur",
        "from a Lorem Ipsum passage, and going through the cities of the word",
        "This book is a treatise on the theory of ethics, very popular during the.",
        "The first line of Lorem Ipsum, Lorem ipsum dolor sit amet..",
    ]
    
    let color = [
        "be6e46",
        "cde7b0",
        "A3BFA8",
        "7286A0",
        "59594A",
        "4F5D75",
        "A59132",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
  }
   
   
    @IBAction func pressFunFact(_ sender: UIButton) {
       update()
    }
    
   func update(){
      
        let newNumber = Int.random(in: 0 ..< text.count)
        
        if newNumber != randomNumber {
            randomNumber = newNumber
        } else if newNumber == randomNumber && randomNumber < text.count - 1
        {
            randomNumber = newNumber + 1
        } else {
            randomNumber = newNumber - 1
        }
        
       print("randomNumber:\(randomNumber)")
        
        // the text color on button have to be managed
        
        view.backgroundColor = UIColor(hexString: color[randomNumber])
        middleLabel.text = text[randomNumber]
  }

}

