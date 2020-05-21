//
//  AppDetalheScreenshotCell.swift
//  App Store
//
//  Created by Ronaldo Souza on 16/05/20.
//  Copyright © 2020 Ronaldo Souza Silva. All rights reserved.
//

import UIKit

class AppDetalheScreenshotCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  var app: App? {
    didSet {
      if app != nil {
        self.collectionView.reloadData()
      }
    }
  }
  
  let cellId = "cellId"
  
  let tituloLabel: UILabel = .textboldLabel(text: "Pré-visualizar", fontSize: 24)
  
  var collectionView: UICollectionView!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    let layout = SnappingLayout()
    layout.scrollDirection = .horizontal
    
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .white
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.decelerationRate = .fast
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    collectionView.register(ScreenshotCell.self, forCellWithReuseIdentifier: cellId)
    
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
    return self.app?.screenshotUrls?.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ScreenshotCell
    
    if let imagemUrl = self.app?.screenshotUrls?[indexPath.item] {
      cell.imageView.sd_setImage(with: URL(string: imagemUrl), completed: nil)
    }
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return .init(width: 220, height: collectionView.bounds.height)
  }
  
}

class ScreenshotCell: UICollectionViewCell {
  
  let imageView: UIImageView = .screenshotImageView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    imageView.image = UIImage(named: "screenshot")
    
    addSubview(imageView)
    imageView.preencherSuperview()
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
  
}
