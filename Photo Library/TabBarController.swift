//
//  TabBarController.swift
//  Photo Library
//
//  Created by Viktor Smirnov on 05.06.2020.
//  Copyright © 2020 Viktor Smirnov. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewC = ViewController()
        let searchBar = SearchController()
    
        tabBar.tintColor = .red
        tabBar.barTintColor = .blue
        
        guard let musicImage = UIImage(systemName: "music.house") else { return }
        guard let profileImage = UIImage(systemName: "person.crop.square") else { return }
        viewControllers = [generationNC(rootViewController: viewC, image: musicImage, title: "Музыка"),
                           generationNC(rootViewController: searchBar, image: profileImage, title: "Профиль")]
        
        
    }
    
    func generationNC(rootViewController: UIViewController, image: UIImage, title: String) -> UINavigationController {
          
          let navigationVC = UINavigationController(rootViewController: rootViewController)
          
          navigationVC.tabBarItem.title = title
          navigationVC.tabBarItem.image = image
          navigationVC.navigationBar.prefersLargeTitles = true
          
          
          
          return navigationVC
      }

}
