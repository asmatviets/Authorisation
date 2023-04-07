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
    
    private var user = User.getUser()

    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 15
        
        userNameTF.autocorrectionType = .no
        userNameTF.autocapitalizationType = .none
        userNameTF.smartInsertDeleteType = .no
        passwordTF.isSecureTextEntry = true
        
        userNameTF.text = user.nickName
        passwordTF.text = user.passWord
    }

    // we can use full prepare func below in case we have no custom class for TabBarController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? TabBarController else { return }
        tabBarController.user = user
//        guard let viewControllers = tabBarController.viewControllers else { return }
//
//        viewControllers.forEach { viewController in
//            if let greetVC = viewController as? GreetingsViewController {
//                greetVC.user =  user
//            } else if let navigationVC = viewController as? UINavigationController {
//                guard let personInfoVC = navigationVC.topViewController as? PersonInfoViewController else { return }
//                personInfoVC.user =  user
//            }
//        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func logInButtonTapped() {
        if userNameTF.text == user.nickName && passwordTF.text == user.passWord {
            performSegue(withIdentifier: "TabBarController", sender: nil)
        } else if userNameTF.text != user.nickName || passwordTF.text != user.passWord {
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

