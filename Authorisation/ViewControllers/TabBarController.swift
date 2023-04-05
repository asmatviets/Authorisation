//
//  TabBarController.swift
//  Authorisation
//
//  Created by Andrey Matviets on 05.04.2023.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
    }
}
