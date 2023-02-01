//
//  ViewController.swift
//  Reverse
//
//  Created by Данік on 30/01/2023.
//


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var reversedTextLabel: UILabel!
    @IBOutlet weak var userInputTextView: UITextField!
    
    @IBOutlet weak var changeButtonText: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
        changeButtonText.setTitle("Reverse", for: .normal)
        userInputTextView.delegate = self
        reversedTextLabel.textColor = UIColor.systemBlue
    }
    
    @IBAction func reverseButton(_ sender: UIButton) {
        
        if (changeButtonText.currentTitle == "Reverse") {
            if let textToReverse = userInputTextView.text {
                let separateWords = textToReverse.components(separatedBy: " ")
                reversedTextLabel.text = String(separateWords.map {$0.reversed()}.joined(separator: " "))
                changeButtonText.setTitle("Clear", for: .normal)}
            
        } else if (changeButtonText.currentTitle == "Clear")   {
            reversedTextLabel.text = ""
            userInputTextView.text = ""
            changeButtonText.setTitle("Reverse", for: .normal)
            progressBar.progress = 0.0
            userInputTextView.endEditing(true)
        }
        
    }
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == userInputTextView {
            progressBar.progress = 1.0
            userInputTextView.becomeFirstResponder()
        }
    }
}
