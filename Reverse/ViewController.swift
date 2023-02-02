//
//  ViewController.swift
//  Reverse
//
//  Created by Данік on 30/01/2023.
//


import UIKit

class ViewController: UIViewController {
    

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
        
        if changeButtonText.titleLabel?.text == "Reverse" {
            if let textToReverse = userInputTextView.text {
                let separateWords = textToReverse.components(separatedBy: " ")
                reversedTextLabel.text = String(separateWords.map {$0.reversed()}.joined(separator: " "))
                viewBecomesBlue()
                changeButtonText.setTitle("Clear", for: .normal)
            }
            
        } else if changeButtonText.titleLabel?.text == "Clear"   {
            reversedTextLabel.text = ""
            userInputTextView.text = ""
            changeButtonText.setTitle("Reverse", for: .normal)
            
            userInputTextView.endEditing(true)
            viewBecomesGray()
            disableButton()
        }
        
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


extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == userInputTextView {
            viewBecomesBlue()
            userInputTextView.becomeFirstResponder()
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text?.count != 0 {
            enableButton()
        } else {
            disableButton()
        }
    }
}

// MARK: - dismissKeyboard when tapped around
extension ViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
        viewBecomesGray()
    }
}
