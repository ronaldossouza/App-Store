//
//  HojeDetalheUnico.swift
//  App Store
//
//  Created by Ronaldo Souza on 16/05/20.
//  Copyright © 2020 Ronaldo Souza Silva. All rights reserved.
//


import UIKit

class HojeDetalheUnico: UITableViewController {
  
  let cellId = "cellId"
  
  var hojeApp: HojeApp?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.backgroundColor = .white
    tableView.separatorStyle = .none
    tableView.allowsSelection = false
    tableView.contentInsetAdjustmentBehavior = .never
    tableView.register(HojeDetalheUnicoCell.self, forCellReuseIdentifier: cellId)
    
    self.adicionarHeader()
  }
  
  func adicionarHeader () {
    let headerView = UIView(frame: .init(x: 0, y: 0, width: view.bounds.width, height: view.bounds.width + 48))
    
    let hojeCell = HojeCell()
    hojeCell.hojeApp = self.hojeApp
    hojeCell.layer.cornerRadius = 0
    
    headerView.addSubview(hojeCell)
    hojeCell.preencherSuperview()
    
    self.tableView.tableHeaderView = headerView
  }
  
}

extension HojeDetalheUnico {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HojeDetalheUnicoCell
    return cell
  }
}
