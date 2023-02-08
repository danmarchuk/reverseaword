//
//  ViewController.swift
//  Reverse
//
//  Created by Данік on 30/01/2023.
//


import UIKit

class ReverseApp: UIViewController {
    

    @IBOutlet weak var grayBlueView: UIView!
    
    @IBOutlet weak var reversedTextLabel: UILabel!
    @IBOutlet weak var userInputTextView: UITextField!
    
    @IBOutlet weak var changeButtonText: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        userInputTextView.delegate = self
        reversedTextLabel.textColor = UIColor.systemBlue
        self.hideKeyboardWhenTappedAround()
        disableButton()
    }
    
    
    @IBAction func reverseButton(_ sender: UIButton) {
        
        
        if reversedTextLabel.text?.count == 0 {
            if let textToReverse = userInputTextView.text {
                // reverseButton is Clicked
                let separateWords = reverseFunction(text: textToReverse)
                reversedTextLabel.text = separateWords
                viewBecomesBlue()
                changeButtonText.setTitle("Clear", for: .normal)
            }
            
            // clear button is clicked
        } else if reversedTextLabel.text?.count != 0  {
            reversedTextLabel.text = ""
            userInputTextView.text = ""
            changeButtonText.setTitle("Reverse", for: .normal)
            userInputTextView.endEditing(true)
            viewBecomesGray()
            disableButton()

        }
    }
    
    func reverseFunction(text: String) -> String {
        let separateWords = text.components(separatedBy: " ")
        let resultString = String(separateWords.map {$0.reversed()}.joined(separator: " "))
        return resultString
    }
    
    
    func viewBecomesBlue() {
        grayBlueView.backgroundColor = UIColor.systemBlue
    }
    
    func viewBecomesGray() {
        grayBlueView.backgroundColor = UIColor.systemGray
    }
    
    func disableButton() {
        changeButtonText.isEnabled = false
    }
    func enableButton() {
        changeButtonText.isEnabled = true
    }
    
}


extension ReverseApp: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
            viewBecomesBlue()
            textField.becomeFirstResponder()

    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text?.count != 0 {
            enableButton()
        } else {
            disableButton()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
    }
}

// MARK: - dismissKeyboard when tapped around
extension ReverseApp {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(ReverseApp.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
        viewBecomesGray()
    }
}
