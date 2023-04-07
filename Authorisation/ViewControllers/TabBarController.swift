//
//  TabBarController.swift
//  Authorisation
//
//  Created by Andrey Matviets on 05.04.2023.
//

import UIKit

final class TabBarController: UITabBarController {

    var user: User!
    
    override func viewDidLoad() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
        
        tabBar.items?.last?.title = user.person.fullName
        
        transferData()
    }
    
    private func transferData() {
        guard let viewControllers else { return }
        
        viewControllers.forEach { viewController in
            if let greetVC = viewController as? GreetingsViewController {
                greetVC.user =  user
            } else if let navigationVC = viewController as? UINavigationController {
                let personInfoVC = navigationVC.topViewController
                guard let personInfoVC = personInfoVC as? PersonInfoViewController else { return }
                personInfoVC.user =  user
            }
        }
    }
}
