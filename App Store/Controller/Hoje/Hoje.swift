//
//  Hoje.swift
//  App Store
//
//  Created by Ronaldo Souza on 16/05/20.
//  Copyright © 2020 Ronaldo Souza Silva. All rights reserved.
//


import UIKit

class Hoje: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  let activityIndicatorView: UIActivityIndicatorView = {
    let ai = UIActivityIndicatorView(style: .large)
    ai.color = UIColor.cinza
    ai.startAnimating()
    ai.hidesWhenStopped = true
    return ai
  }()
  
  let cellId = "cellId"
  let multiploId = "multiploId"
  let headerId = "headerId"
  
  var hojeApps: [HojeApp] = []
  
  init() {
    super.init(collectionViewLayout: UICollectionViewFlowLayout())
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.navigationBar.isHidden = true
    
    collectionView.backgroundColor = .systemGroupedBackground
    collectionView.register(HojeCell.self, forCellWithReuseIdentifier: cellId)
    collectionView.register(HojeMultiploCell.self, forCellWithReuseIdentifier: multiploId)
    collectionView.register(HojeHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    
    view.addSubview(activityIndicatorView)
    activityIndicatorView.centralizasSuperview()
    
    self.buscaHojeDestaques()
  }
  
  func buscaHojeDestaques () {
    HojeService.shared.buscaHojeDestaques { (apps, err) in
      if let apps = apps {
        DispatchQueue.main.async {
          self.hojeApps = apps
          self.collectionView.reloadData()
          self.activityIndicatorView.stopAnimating()
        }
      }
    }
  }
  
}

extension Hoje {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return .init(width: view.bounds.width, height: 90)
  }
  
  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! HojeHeader
    return header
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.hojeApps.count
  }
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    if indexPath.item < 2 {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HojeCell
        cell.hojeApp = self.hojeApps[indexPath.item]
        return cell
    } else {
      
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: multiploId, for: indexPath) as! HojeMultiploCell
      cell.hojeApp = self.hojeApps[indexPath.item]
      return cell
    }
    
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return .init(width: view.bounds.width - 48, height: view.bounds.width + 48)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 24
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return .init(top: 16, left: 0, bottom: 32, right: 0)
  }
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if let cell = collectionView.cellForItem(at: indexPath) {
      if let frame = cell.superview?.convert(cell.frame, to: nil) {
        
        tabBarController?.tabBar.isHidden = true
        
        let modalView = HojeDetalhe()
        modalView.modalPresentationStyle = .overCurrentContext
        
        modalView.handlerFechar = {
          self.tabBarController?.tabBar.isHidden = false
        }
        
        let modalNav = UINavigationController(rootViewController: modalView)
        modalNav.modalPresentationStyle = .overCurrentContext
        modalNav.view.backgroundColor = .clear
        
        self.present(modalNav, animated: false) {
          modalView.frame = frame
          modalView.hojeApp = self.hojeApps[indexPath.item]
        }
        
      }
    }
  }
}
