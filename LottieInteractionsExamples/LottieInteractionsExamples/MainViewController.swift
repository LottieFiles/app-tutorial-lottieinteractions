//
//  MainViewController.swift
//  LottieInteractionsExamples
//
//  Created by Evandro Harrison Hoffmann on 10/05/2022.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tabBar.isTranslucent = false
        tabBar.unselectedItemTintColor = .white
        tabBar.tintColor = .white
        tabBar.barTintColor = UIColor(named: "brand")
        tabBar.shadowImage = UIImage()
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "brand")
        tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            #if !targetEnvironment(macCatalyst)
            tabBar.scrollEdgeAppearance = appearance
            #endif
        }
        
        viewControllers = [
            OpenGiftViewController(),
            ToggleViewController()
        ]
    }


}

