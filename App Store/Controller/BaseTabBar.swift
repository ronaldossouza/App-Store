//
//  BaseTabBar.swift
//  App Store
//
//  Created by Ronaldo Souza on 10/05/20.
//  Copyright © 2020 Ronaldo Souza Silva. All rights reserved.
//
import UIKit

class BaseTabBar: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let hoje  = self.criarTabItem(viewController: Hoje(), titulo: "Hoje", imagem: "icone-hoje")
    let apps  = self.criarTabItem(viewController: Apps(), titulo: "Apps", imagem: "icone-apps")
    let busca = self.criarTabItem(viewController: Busca(), titulo: "Busca", imagem: "icone-busca")
    
    viewControllers = [
      hoje,
      apps,
      busca
    ]
    
    selectedIndex = 0
  }
  
  func criarTabItem (viewController: UIViewController, titulo: String, imagem: String) -> UIViewController {
    let navController = UINavigationController(rootViewController: viewController)
    navController.navigationBar.prefersLargeTitles = true
    
    viewController.navigationItem.title = titulo
    viewController.tabBarItem.title = titulo
    viewController.tabBarItem.image = UIImage(named: imagem)
    viewController.view.backgroundColor = .white
    
    return navController
  }
  
}
