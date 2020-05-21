//
//  UILabel.swift
//  App Store
//
//  Created by Ronaldo Souza on 11/05/20.
//  Copyright © 2020 Ronaldo Souza Silva. All rights reserved.
//

import UIKit

extension UILabel {
  
  static func textLabel (text: String, fontSize: CGFloat, numberOfLines: Int = 1) -> UILabel {
    let label = UILabel()
    
    label.font = UIFont.systemFont(ofSize: fontSize)
    label.numberOfLines = numberOfLines
    label.text = text
    
    return label
  }
  
  static func textboldLabel (text: String, fontSize: CGFloat, numberOfLines: Int = 1) -> UILabel {
    let label = UILabel()
    
    label.font = UIFont.boldSystemFont(ofSize: fontSize)
    label.numberOfLines = numberOfLines
    label.text = text
    
    return label
  }
  
}
