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
    }

    @IBAction func reverseButton(_ sender: UIButton) {
        if let textToReverse = userInputTextView.text {
            let separateWords = textToReverse.components(separatedBy: " ")
            reversedTextLabel.text = String(separateWords.map {$0.reversed()}.joined(separator: " "))
            userInputTextView.text = ""
                
            }

        }
        
    }
    

