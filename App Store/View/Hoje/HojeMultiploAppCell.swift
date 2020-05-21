//
//  HojeMultiploAppCell.swift
//  App Store
//
//  Created by Ronaldo Souza on 16/05/20.
//  Copyright © 2020 Ronaldo Souza Silva. All rights reserved.
//


import UIKit

class HojeMultiploAppCell: UITableViewCell {
  
  var app: App? {
    didSet {
      if let app = app {
        iconeImageView.sd_setImage(with: URL(string: app.iconeUrl), completed: nil)
        tituloLabel.text = app.nome
        empresaLabel.text = app.empresa
      }
    }
  }
  
  let iconeImageView: UIImageView = .iconeImageView(width: 48, heigth: 48)
  let tituloLabel: UILabel = .textLabel(text: "App nome", fontSize: 16)
  let empresaLabel: UILabel = .textLabel(text: "App empresa", fontSize: 14)
  let obterButton: UIButton = .obterButton()
  
  var leadingConstraint: NSLayoutConstraint?
  var trailingConstraint: NSLayoutConstraint?
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    selectionStyle = .none
    
    let tituloEmpresaStackView = UIStackView(arrangedSubviews: [tituloLabel, empresaLabel])
    tituloEmpresaStackView.spacing = 4
    tituloEmpresaStackView.axis = .vertical
    
    let stackView = UIStackView(arrangedSubviews: [iconeImageView, tituloEmpresaStackView, obterButton])
    stackView.spacing = 16
    stackView.alignment = .center
    
    addSubview(stackView)
    //stackView.preencherSuperview(padding: .init(top: 14, left: 0, bottom: 14, right: 0))
    stackView.preencher(
      top: topAnchor,
      leading: nil,
      bottom: bottomAnchor,
      trailing: nil,
      padding: .init(top: 14, left: 0, bottom: 14, right: 0)
    )
    
    self.leadingConstraint = stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0)
    self.trailingConstraint = stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
    
    self.leadingConstraint?.isActive = true
    self.trailingConstraint?.isActive = true
    
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
  
}
