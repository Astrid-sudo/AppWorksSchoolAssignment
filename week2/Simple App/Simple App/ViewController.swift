//
//  ViewController.swift
//  Simple App
//
//  Created by Astrid on 2021/8/5.
//

import UIKit

class ViewController: UIViewController {
    
    var randomNumber = 0
    // if random number is the same after press button, should generate new numbers until it show a different one.
    // the text color on button have to be managed
    @IBOutlet weak var middleLabel: UILabel!
    
    @IBAction func pressFunFact(_ sender: UIButton) {
        randomNumber = Int.random(in: 0...6)
        update()
        
    }
    
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
    
    func update(){
        view.backgroundColor = UIColor(hexString: color[randomNumber])
        middleLabel.text = text[randomNumber]
  }
        
   
    
}

