//
//  HojeDetalheUnicoCell.swift
//  App Store
//
//  Created by Ronaldo Souza on 16/05/20.
//  Copyright © 2020 Ronaldo Souza Silva. All rights reserved.
//


import UIKit

class HojeDetalheUnicoCell: UITableViewCell {
  
  let descricaoLabel: UILabel = {
    let label = UILabel()
    
    let atributoTexto = NSMutableAttributedString(
      string: "Lorem Ipsum",
      attributes: [NSAttributedString.Key.foregroundColor : UIColor.black]
    )
    
    atributoTexto.append(NSAttributedString(
      string: " é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos.",
      attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
    )
    
    atributoTexto.append(NSAttributedString(
      string: "\n\nDe onde ele vem?",
      attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
    )
    
    atributoTexto.append(NSAttributedString(
      string: " é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos.",
      attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
    )
    
    atributoTexto.append(NSAttributedString(
      string: "\n\nDe onde ele vem?",
      attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
    )
    
    atributoTexto.append(NSAttributedString(
      string: " é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos.",
      attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
    )
    
    atributoTexto.append(NSAttributedString(
      string: "\n\nDe onde ele vem?",
      attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
    )
    
    atributoTexto.append(NSAttributedString(
      string: " é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos.",
      attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
    )
    
    atributoTexto.append(NSAttributedString(
      string: "\n\nDe onde ele vem?",
      attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
    )
    
    atributoTexto.append(NSAttributedString(
      string: " é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos.",
      attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
    )
    
    label.attributedText = atributoTexto
    label.font = UIFont.systemFont(ofSize: 14)
    label.numberOfLines = 0
    
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    addSubview(descricaoLabel)
    descricaoLabel.preencherSuperview(padding: .init(
      top: 24,
      left: 24,
      bottom: 24,
      right: 24
    ))
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
}
