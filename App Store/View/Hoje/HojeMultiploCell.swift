//
//  HojeMultiploCell.swift
//  App Store
//
//  Created by Ronaldo Souza on 16/05/20.
//  Copyright © 2020 Ronaldo Souza Silva. All rights reserved.
//


import UIKit

class HojeMultiploCell: UICollectionViewCell, UITableViewDelegate, UITableViewDataSource {
  
  var hojeApp: HojeApp? {
    didSet {
      if let hojeApp = hojeApp {
        categoriaLabel.text = hojeApp.categoria
        tituloLabel.text = hojeApp.titulo
        tableView.reloadData()
      }
    }
  }
  
  let cellId = "cellId"
  
  let categoriaLabel: UILabel = .textLabel(text: "VIAGEM", fontSize: 18)
  let tituloLabel: UILabel = .textboldLabel(text: "Explore o mundo \nsem medo", fontSize: 28, numberOfLines: 2)
  
  var tableView: UITableView!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .white
    layer.cornerRadius = 16
    clipsToBounds = true
    
    tableView = UITableView()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.isUserInteractionEnabled = false
    tableView.separatorInset = UIEdgeInsets(top: 0, left: 64, bottom: 0, right: 0)
    
    tableView.register(HojeMultiploCell.self, forCellReuseIdentifier: cellId)
    
    let stackView = UIStackView(arrangedSubviews: [categoriaLabel, tituloLabel])
    stackView.axis = .vertical
    stackView.spacing = 8
    
    addSubview(stackView)
    stackView.preencher(
      top: self.safeAreaLayoutGuide.topAnchor,
      leading: leadingAnchor,
      bottom: nil,
      trailing: trailingAnchor,
      padding: .init(top: 24, left: 24, bottom: 24, right: 24)
    )
    
    addSubview(tableView)
    tableView.preencher(
      top: stackView.bottomAnchor,
      leading: leadingAnchor,
      bottom: bottomAnchor,
      trailing: trailingAnchor,
      padding: .init(top: 24, left: 24, bottom: 24, right: 24)
    )
    
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.hojeApp?.apps?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HojeMultiploAppCell
    cell.app = self.hojeApp?.apps?[indexPath.item]
    return cell
  }
  
}
