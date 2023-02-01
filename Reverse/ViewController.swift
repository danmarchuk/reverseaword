//
//  ViewController.swift
//  Reverse
//
//  Created by Данік on 30/01/2023.
//


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var reversedTextLabel: UILabel!
    @IBOutlet weak var userInputTextView: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func reverseButton(_ sender: UIButton) {
        if let textToReverse = userInputTextView.text {
            
            var result = ""
            
            let separateWords = textToReverse.components(separatedBy: " ")
            
            
            for aWord in separateWords {
                let reversedWordsWithSpace = String(aWord.reversed() + " ")
                result.append(reversedWordsWithSpace)
                reversedTextLabel.text = result
                userInputTextView.text = ""
            }
        }
        
    }
    
}
