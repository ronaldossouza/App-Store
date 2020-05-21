//
//  AppDetalheAvalicaoCell.swift
//  App Store
//
//  Created by Ronaldo Souza on 16/05/20.
//  Copyright © 2020 Ronaldo Souza Silva. All rights reserved.
//


import UIKit

class AppDetalheAvalicaoCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  var app: App? {
    didSet {
      if app != nil {
        self.collectionView.reloadData()
      }
    }
  }
  
  let cellId = "cellId"
  
  let tituloLabel: UILabel = .textboldLabel(text: "Avaliações e opiniões", fontSize: 24)
  
  var collectionView: UICollectionView!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    let layout = SnappingLayout()
    layout.scrollDirection = .horizontal
    
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .white
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.decelerationRate = .fast
    collectionView.register(ComentarioCell.self, forCellWithReuseIdentifier: cellId)
    
    addSubview(tituloLabel)
    tituloLabel.preencher(
      top: topAnchor,
      leading: leadingAnchor,
      bottom: nil,
      trailing: trailingAnchor,
      padding: .init(top: 20, left: 20, bottom: 0, right: 20)
    )
    
    addSubview(collectionView)
    collectionView.preencher(
      top: tituloLabel.bottomAnchor,
      leading: leadingAnchor,
      bottom: bottomAnchor,
      trailing: trailingAnchor,
      padding: .init(top: 20, left: 0, bottom: 0, right: 0)
    )
    
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.app?.comentarios?.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ComentarioCell
    
    if let comentario = self.app?.comentarios?[indexPath.item] {
      cell.comentario = comentario
    }
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return .init(width: collectionView.bounds.width - 40, height: collectionView.bounds.height)
  }
  
}


class ComentarioCell: UICollectionViewCell {
  
  var comentario: AppComentario? {
    didSet {
      if let comentario = comentario {
        tituloLabel.text = comentario.titulo
        comentarioLabeL.text = comentario.descricao
        avaliacaoImageView.image = UIImage(named: "avaliacao-\(comentario.avaliacao)")
      }
    }
  }
  
  let tituloLabel: UILabel = .textboldLabel(text: "Muito bom", fontSize: 16)
  let comentarioLabeL: UILabel = .textLabel(text: "Recomendo bastante esse app, esta me ajudando muito", fontSize: 16, numberOfLines: 0)
  
  let avaliacaoImageView: UIImageView = {
    let imagem = UIImageView()
    imagem.size(size: .init(width: 120, height: 24))
    imagem.contentMode = .scaleAspectFit
    return imagem
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = UIColor.background
    layer.cornerRadius = 12
    layer.masksToBounds = true
    clipsToBounds = true
    
    avaliacaoImageView.image = UIImage(named: "avaliacao-4")
    
    let headerStackView = UIStackView(arrangedSubviews: [tituloLabel, avaliacaoImageView])
    
    let comentarioStackView = UIStackView(arrangedSubviews: [comentarioLabeL])
    comentarioStackView.alignment = .top
    
    let stackView = UIStackView(arrangedSubviews: [headerStackView, comentarioStackView])
    stackView.axis = .vertical
    stackView.spacing = 12
    
    addSubview(stackView)
    stackView.preencherSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
  
}
