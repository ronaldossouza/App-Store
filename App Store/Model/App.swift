//
//  App.swift
//  App Store
//
//  Created by Ronaldo Souza on 11/05/20.
//  Copyright © 2020 Ronaldo Souza Silva. All rights reserved.
//

import Foundation

struct App: Decodable {
  let id: Int
  let nome: String
  let empresa: String
  let avalicao: String?
  let iconeUrl: String
  let descricao: String?
  let screenshotUrls: [String]?
  let comentarios: [AppComentario]?
}

struct AppDestaque: Decodable {
  let id: Int
  let nome: String
  let empresa: String
  let imagemUrl: String
  let descricao: String
}

struct AppGrupo: Decodable {
  let id: String
  let titulo: String
  let apps: [App]
}

struct AppComentario: Decodable {
  let id: Int
  let titulo: String
  let avaliacao: Int
  let descricao: String?
}


