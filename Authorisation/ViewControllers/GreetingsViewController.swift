//
//  GreetingsViewController.swift
//  Authorisation
//
//  Created by Andrey Matviets on 02.04.2023.
//

import UIKit

final class GreetingsViewController: UIViewController {

    @IBOutlet var greetLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        greetLabel.text = """
        Welcome, \(user.nickName)! \n
        My name is \(user.person.fullName)
        """
    }
}
