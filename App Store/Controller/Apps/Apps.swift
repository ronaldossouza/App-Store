//
//  Apps.swift
//  App Store
//
//  Created by Ronaldo Souza on 12/05/20.
//  Copyright © 2020 Ronaldo Souza Silva. All rights reserved.
//

import UIKit

class Apps: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  let cellId = "cellId"
  let headerId = "headerId"
  
  let activityIndicatorView: UIActivityIndicatorView = {
    let ai = UIActivityIndicatorView(style: .large)
    ai.color = UIColor.cinza
    ai.startAnimating()
    ai.hidesWhenStopped = true
    return ai
  }()
  
  var appsEmDestaque: [AppDestaque] = []
  var appsGrupos: [AppGrupo] = []
  
  init() {
    super.init(collectionViewLayout: UICollectionViewFlowLayout())
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.backgroundColor = .white
    
    collectionView.register(AppsGrupoCell.self, forCellWithReuseIdentifier: cellId)
    collectionView.register(AppsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    
    view.addSubview(activityIndicatorView)
    activityIndicatorView.centralizasSuperview()
    
    self.buscaApps()
//    self.buscaAppsEmDestaque()
//    self.buscaGrupos(tipo: "apps-que-amamos")
//    self.buscaGrupos(tipo: "top-apps-gratis")
//    self.buscaGrupos(tipo: "top-apps-pagos")
  }
  
}

extension Apps {
  func buscaApps () {
    
    var appsEmDestaque: [AppDestaque]?
    var appsQuemAmamos: AppGrupo?
    var topAppsGratis: AppGrupo?
    var topAppsPagos: AppGrupo?
    
    let dispatchGroup = DispatchGroup()
    
    // Apps em destaque
    dispatchGroup.enter()
    AppService.shared.buscaAppsEmDestaque { (apps, err) in
      appsEmDestaque = apps
      dispatchGroup.leave()
    }
    
    // Apps que amamos
    dispatchGroup.enter()
    AppService.shared.buscaGrupo(tipo: "apps-que-amamos") { (grupo, err) in
      appsQuemAmamos = grupo
      dispatchGroup.leave()
    }
    
    // Top apps gratis
    dispatchGroup.enter()
    AppService.shared.buscaGrupo(tipo: "top-apps-gratis") { (grupo, err) in
      topAppsGratis = grupo
      dispatchGroup.leave()
    }
    
    // Top apps pagos
    dispatchGroup.enter()
    AppService.shared.buscaGrupo(tipo: "top-apps-pagos") { (grupo, err) in
      topAppsPagos = grupo
      dispatchGroup.leave()
    }
    
    dispatchGroup.notify(queue: .main) {
      
      if let apps = appsEmDestaque {
        self.appsEmDestaque = apps
      }
      
      if let apps = appsQuemAmamos {
        self.appsGrupos.append(apps)
      }
      
      if let apps = topAppsGratis {
        self.appsGrupos.append(apps)
      }
      
      if let apps = topAppsPagos {
        self.appsGrupos.append(apps)
      }
      
      self.activityIndicatorView.stopAnimating()
      self.collectionView.reloadData()
    }
    
  }
}

extension Apps {
  
  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppsHeader
    header.appsEmDestaque = self.appsEmDestaque
    header.collectionView.reloadData()
    return header
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return .init(top: 20, left: 0, bottom: 20, right: 0)
  }
    
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return .init(width: view.bounds.width, height: view.bounds.width * 0.8)
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.appsGrupos.count
  }
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGrupoCell
    cell.grupo = self.appsGrupos[indexPath.item]
    cell.appsGrupoHorizontalVC.callback = { (app) in
      let appDetalhe = AppDetalhe()
      appDetalhe.appId = app.id
      appDetalhe.app = app
      self.navigationController?.pushViewController(appDetalhe, animated: true)
    }
    return cell
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return .init(width: view.bounds.width, height: 280)
  }
}
