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
    
    private let userName = "admin"
    private let userPassword = "123"
    
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
        greetVC.greet =  userName
        greetVC.emoji = "👋🏼"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
    @IBAction func logInButtonTapped() {
        if userNameTF.text == userName && passwordTF.text == userPassword {
            performSegue(withIdentifier: "showGreetingsVC", sender: nil)
        } else {
            showAlert(
                withTitle: "🤬Oops!",
                andMessage: "You've entered wrong name or password",
                textField: passwordTF
            )
        }
    }
    
    @IBAction func forgotRegisteredData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(withTitle: "Oops 🤔, don't remember name?", andMessage: "Use: admin")
        : showAlert(withTitle: "Oops 🤯, don't remember password?", andMessage: "Use: 123")
    }
    
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    private func showAlert(withTitle title: String, andMessage message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Got it", style: .default) { _ in
            self.passwordTF.text = ""
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

