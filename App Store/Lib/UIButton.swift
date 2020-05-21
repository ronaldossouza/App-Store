//
//  UIButton.swift
//  App Store
//
//  Created by Ronaldo Souza on 11/05/20.
//  Copyright © 2020 Ronaldo Souza Silva. All rights reserved.
//

import UIKit

extension UIButton {
  
  static func obterButton () -> UIButton {
    let button = UIButton(type: .system)
    
    button.setTitle("OBTER", for: .normal)
    button.setTitleColor(UIColor.azul, for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.backgroundColor = UIColor(white: 0.95, alpha: 1)
    
    button.size(size: .init(width: 80, height: 32))
    button.layer.cornerRadius = 16
    button.clipsToBounds = true
    
    return button
  }
  
  static func fecharButton () -> UIButton {
    let button = UIButton(type: .system)
    button.setImage(UIImage(named: "fechar"), for: .normal)
    button.layer.zPosition = 2
    return button
  }
  
}
