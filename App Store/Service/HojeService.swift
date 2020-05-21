//
//  HojeService.swift
//  App Store
//
//  Created by Ronaldo Souza on 16/05/20.
//  Copyright © 2020 Ronaldo Souza Silva. All rights reserved.
//



import Foundation

class HojeService {
  
  static let shared = HojeService()
  
  func buscaHojeDestaques (completion: @escaping ([HojeApp]?, Error?) -> ()) {
    
    var hojeApps: Array<HojeApp> = [
      HojeApp(
        id: 1,
        categoria: "VIAGEM",
        titulo: "Explore o mundo \nsem medo",
        imagemUrl: "destaque-1",
        descricao: "Podemos viajar o mundo em busca da beleza, mas nunca a encontraremos se não a carregarmos dentro de nós.",
        backgroundColor: "#FFFFFF",
        apps: nil
      ),
      HojeApp(
        id: 2,
        categoria: "PRATIQUE HOJE",
        titulo: "Matenha corpo \ne mente saudáveis",
        imagemUrl: "destaque-2",
        descricao: "Quanto mais se rema, maiores são as chances de pegar as melhores ondas, tanto no surf quanto na vida.",
        backgroundColor: "#69CCE0",
        apps: nil
      )
    ]
    
    AppService.shared.buscaApps { (apps, err) in
      if let apps = apps {
        hojeApps.append(
          HojeApp(
            id: 3,
            categoria: "A LISTA DO DIA",
            titulo: "Pedale melhor com \nApple Watch",
            imagemUrl: nil,
            descricao: nil,
            backgroundColor: nil,
            apps: apps
          )
        )
      }
      
      completion(hojeApps, nil)
    }
    
    
  }
    
}
