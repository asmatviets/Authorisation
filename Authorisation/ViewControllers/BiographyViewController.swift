//
//  BiographyViewController.swift
//  Authorisation
//
//  Created by Andrey Matviets on 05.04.2023.
//

import UIKit

final class BiographyViewController: UIViewController {

    @IBOutlet var bioLabel: UILabel!
    
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        bioLabel.text = user.person.biography
    }
}
