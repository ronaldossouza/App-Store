//
//  AppsGrupoHorizontalCell.swift
//  App Store
//
//  Created by Ronaldo Souza on 16/05/20.
//  Copyright © 2020 Ronaldo Souza Silva. All rights reserved.
//


import UIKit

class AppsGrupoHorizontalCell: UICollectionViewCell {
  
  var app: App? {
    didSet {
      if let app = app {
        iconeImageView.sd_setImage(with: URL(string: app.iconeUrl), completed: nil)
        tituloLabel.text = app.nome
        empresaLabel.text = app.empresa
      }
    }
  }
  
  let iconeImageView: UIImageView = .iconeImageView()
  let tituloLabel: UILabel = .textLabel(text: "App nome", fontSize: 18, numberOfLines: 2)
  let empresaLabel: UILabel = .textLabel(text: "App empresa", fontSize: 14)
  let obterButton: UIButton = .obterButton()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    let bottomLine = CALayer()
    bottomLine.frame = CGRect(x: 80, y: bounds.height, width: bounds.width - 80, height: 0.8)
    bottomLine.backgroundColor = UIColor.cinza.cgColor
    layer.addSublayer(bottomLine)
    
    let tituloEmpresaStackView = UIStackView(arrangedSubviews: [tituloLabel, empresaLabel])
    tituloEmpresaStackView.spacing = 4
    tituloEmpresaStackView.axis = .vertical
    
    let stackView = UIStackView(arrangedSubviews: [iconeImageView, tituloEmpresaStackView, obterButton])
    stackView.spacing = 12
    stackView.alignment = .center
    
    addSubview(stackView)
    stackView.preencherSuperview()
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
  
}
