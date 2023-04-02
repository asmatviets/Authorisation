//
//  GreetingsViewController.swift
//  Authorisation
//
//  Created by Andrey Matviets on 02.04.2023.
//

import UIKit

final class GreetingsViewController: UIViewController {

    @IBOutlet var greetLabel: UILabel!
    @IBOutlet var greetEmojiLabel: UILabel!
    
    var greet: String!
    var emoji: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetLabel.text = greet
        greetEmojiLabel.text = emoji
        
        setGradientBackground()
    }
    
    private func setGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.systemBlue.cgColor,
            UIColor.purple.cgColor
        ]
        
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [0, 0.65, 0.7, 0.75, 0.8, 1]
        gradientLayer.opacity = 0.5
        
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
