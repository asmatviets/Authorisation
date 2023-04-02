//
//  ViewController.swift
//  Authorisation
//
//  Created by Andrey Matviets on 02.04.2023.
//

import UIKit

final class MainViewController: UIViewController {

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    @IBOutlet var logInButton: UIButton!
    
    private var userName = "admin"
    private var userPassword = "123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 15
        
        userNameTF.autocorrectionType = .no
        userNameTF.autocapitalizationType = .none
        userNameTF.smartInsertDeleteType = .no
        passwordTF.isSecureTextEntry = true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let greetVC = segue.destination as? GreetingsViewController else {
            return
        }
        greetVC.greet =  "Welcome, \(userNameTF.text ?? "Anonymous")"
        greetVC.emoji = "👋🏼"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
    @IBAction func logInButtonTapped() {
        if self.userNameTF.text == userName && self.passwordTF.text == userPassword {
        } else {
            showAlert(
                withTitle: "🤬Oops!",
                andMessage: "You've entered wrong name or password"
            )
        }
    }
    
    @IBAction func nameReminderTapped() {
        showAlert(
            withTitle: "Oops 🤔, don't remember name?",
            andMessage: "Use: admin"
        )
    }
    
    @IBAction func passReminderTapped() {
        showAlert(
            withTitle: "Oops 🤯, don't remember password?",
            andMessage: "Use: 123"
        )
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        self.userNameTF.text = ""
        self.passwordTF.text = ""
        viewDidLoad()
    }
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "Got it", style: .default) { _ in
            self.passwordTF.text = ""
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

