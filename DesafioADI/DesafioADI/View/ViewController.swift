//
//  ViewController.swift
//  DesafioADI
//
//  Created by Morgana Galamba on 22/12/21.
//

import UIKit

class ViewController: UITabBarController, UITabBarControllerDelegate{
    
    override func viewDidLoad() {
            super.viewDidLoad()
            self.delegate = self
            
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            let rootVc = ExploreViewController()
            let tabOne = UINavigationController(rootViewController: rootVc)
            let tabOneBarItem = UITabBarItem(title: "Explore", image: UIImage(systemName: "square.grid.2x2"), selectedImage: UIImage(systemName: "square.grid.2x2.fill"))
            tabOne.tabBarItem = tabOneBarItem
            
            
            let rootVc2 = AccountTableViewController()
            let tabTwo = UINavigationController(rootViewController: rootVc2)
            let tabTwoBarItem2 = UITabBarItem(title: "Account", image: UIImage(systemName: "person.circle"), selectedImage: UIImage(systemName: "person.circle.fill"))
            tabTwo.tabBarItem = tabTwoBarItem2
            
            
            self.viewControllers = [tabOne, tabTwo]
        }
}
