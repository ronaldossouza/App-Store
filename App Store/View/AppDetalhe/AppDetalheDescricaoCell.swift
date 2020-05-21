//
//  AppDetalheDescricaoCell.swift
//  App Store
//
//  Created by Ronaldo Souza on 16/05/20.
//  Copyright © 2020 Ronaldo Souza Silva. All rights reserved.
//

import UIKit

class AppDetalheDescricaoCell: UICollectionViewCell {
  
  var app: App? {
    didSet {
      if let app = app {
        descricaoLabel.text = app.descricao
      }
    }
  }
  
  let tituloLabel: UILabel = .textboldLabel(text: "Novidades", fontSize: 24)
  let descricaoLabel: UILabel = .textLabel(text: "Descrição", fontSize: 12, numberOfLines: 0)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    let stackView = UIStackView(arrangedSubviews: [tituloLabel, descricaoLabel])
    stackView.spacing = 12
    stackView.axis = .vertical
    
    addSubview(stackView)
    stackView.preencherSuperview(padding: .init(top: 0, left: 20, bottom: 0, right: 20))
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
  
}
