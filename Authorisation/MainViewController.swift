//
//  ViewController.swift
//  Authorisation
//
//  Created by Andrey Matviets on 02.04.2023.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    @IBOutlet var logInButton: UIButton!
    
    private var userName = "admin"
    private var userPassword = "123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 15
    }

    @IBAction func logInButtonTapped() {
        if self.userNameTF.text == userName && self.passwordTF.text == userPassword {
            // some code
        } else {
            showAlert(withTitle: "Oops!", andMessage: "You've entered wrong name or pasword")
        }
    }
    
    @IBAction func nameReminderTapped() {
        showAlert(withTitle: "Oops, don't remember name?", andMessage: "Use: admin")
    }
    
    @IBAction func passReminderTapped() {
        showAlert(withTitle: "Oops, don't remember password?", andMessage: "Use: 123")
    }
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Got it", style: .default) { _ in
            self.passwordTF.text = ""
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

