//
//  UIView.swift
//  App Store
//
//  Created by Ronaldo Souza on 10/05/20.
//  Copyright © 2020 Ronaldo Souza Silva. All rights reserved.
//

import UIKit

extension UIView {
  
  func preencher(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = UIEdgeInsets.zero, size: CGSize = CGSize.zero) {
    translatesAutoresizingMaskIntoConstraints = false
    if let top = top {
      topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
    }
    if let leading = leading {
      leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
    }
    if let bottom = bottom {
      bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
    }
    if let trailing = trailing {
      trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
    }
    if size.width != 0 {
      widthAnchor.constraint(equalToConstant: size.width).isActive = true
    }
    if size.height != 0 {
      heightAnchor.constraint(equalToConstant: size.height).isActive = true
    }
  }
  
  func preencherSuperview(padding: UIEdgeInsets = .zero) {
      translatesAutoresizingMaskIntoConstraints = false
      if let superviewTopAnchor = superview?.topAnchor {
          topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
      }
      
      if let superviewBottomAnchor = superview?.bottomAnchor {
          bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
      }
      
      if let superviewLeadingAnchor = superview?.leadingAnchor {
          leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
      }
      
      if let superviewTrailingAnchor = superview?.trailingAnchor {
          trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
      }
  }
  
  func centralizasSuperview(size: CGSize = .zero) {
      translatesAutoresizingMaskIntoConstraints = false
      
      if let superviewCenterXAnchor = superview?.centerXAnchor {
          centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
      }
      
      if let superviewCenterYAnchor = superview?.centerYAnchor {
          centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
      }
      
      if size.width != 0 {
          widthAnchor.constraint(equalToConstant: size.width).isActive = true
      }
      
      if size.height != 0 {
          heightAnchor.constraint(equalToConstant: size.height).isActive = true
      }
  }
  
  func size(size: CGSize = .zero) {
      translatesAutoresizingMaskIntoConstraints = false
      
      if size.width != 0 {
          widthAnchor.constraint(equalToConstant: size.width).isActive = true
      }
      
      if size.height != 0 {
          heightAnchor.constraint(equalToConstant: size.height).isActive = true
      }
  }
  
}

