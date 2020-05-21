//
//  HojeDetalheMultiplo.swift
//  App Store
//
//  Created by Ronaldo Souza on 16/05/20.
//  Copyright © 2020 Ronaldo Souza Silva. All rights reserved.
//


import UIKit

class HojeDetalheMultiplo: UITableViewController {
  
  var hojeApp: HojeApp? {
    didSet {
      if let hojeApp = hojeApp {
        
        let header = HojeMultiploHeader(frame: .init(x: 0, y: 0, width: view.bounds.width, height: 145))
        header.hojeApp = hojeApp
        
        tableView.tableHeaderView = header
        tableView.reloadData()
        
      }
    }
  }
  
  let cellId = "cellId"
  
  var handlerClique: ((App) -> ())?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.separatorInset = UIEdgeInsets(top: 0, left: 90, bottom: 0, right: 24)
    tableView.register(HojeMultiploAppCell.self, forCellReuseIdentifier: cellId)
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.hojeApp?.apps?.count ?? 0
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HojeMultiploAppCell
    
    cell.app = self.hojeApp?.apps?[indexPath.item]
    cell.leadingConstraint?.constant = 24
    cell.trailingConstraint?.constant = -24
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let app = self.hojeApp?.apps?[indexPath.item] {
      self.handlerClique?(app)
    }
  }
  
}
