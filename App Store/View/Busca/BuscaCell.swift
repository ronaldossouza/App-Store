//
//  BuscaCell.swift
//  App Store
//
//  Created by Ronaldo Souza on 10/05/20.
//  Copyright © 2020 Ronaldo Souza Silva. All rights reserved.
//

import UIKit
import SDWebImage

class BuscaCell: UITableViewCell {
    
    var app: App! {
        didSet {
            tituloLabel.text = app.nome
            empresaLabel.text = app.empresa
            
            iconeImageView.sd_setImage(with: URL(string: app.iconeUrl), completed: nil)
            
            if let screenshotUrls = app.screenshotUrls {
                if screenshotUrls.count > 0 {
                    self.screenshot1ImageView.sd_setImage(with: URL(string: screenshotUrls[0]), completed: nil)
                }
                if screenshotUrls.count > 1 {
                    self.screenshot2ImageView.sd_setImage(with: URL(string: screenshotUrls[1]), completed: nil)
                }
                
                if screenshotUrls.count > 2 {
                    self.screenshot3ImageView.sd_setImage(with: URL(string: screenshotUrls[2]), completed: nil)
                    
                }
            }
            
        }
    }
    
    
    let iconeImageView: UIImageView = .iconeImageView()
    let tituloLabel: UILabel = .textLabel(text: "App nome", fontSize: 18, numberOfLines: 2)
    let empresaLabel: UILabel = .textLabel(text: "Empresa nome", fontSize: 14)
    let obterButton: UIButton = .obterButton()
    
    let screenshot1ImageView: UIImageView = .screenshotImageView()
    let screenshot2ImageView: UIImageView = .screenshotImageView()
    let screenshot3ImageView: UIImageView = .screenshotImageView()
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let tituloEmpresaStackView = UIStackView(arrangedSubviews: [tituloLabel, empresaLabel])
        tituloEmpresaStackView.spacing = 8
        tituloEmpresaStackView.axis = .vertical
        
        
        
        
        let headerstackView = UIStackView(arrangedSubviews: [iconeImageView, tituloEmpresaStackView, obterButton])
        headerstackView.spacing = 12
        headerstackView.alignment = .center
        
        let screenshotStackView = UIStackView(arrangedSubviews: [
            screenshot1ImageView,
            screenshot2ImageView,
            screenshot3ImageView])
        
        screenshotStackView.spacing = 12
        screenshotStackView.distribution = .fillEqually
        
        let globalStackView = UIStackView(arrangedSubviews: [headerstackView, screenshot1ImageView])
        globalStackView.spacing = 16
        globalStackView.axis = .vertical
        
        addSubview(globalStackView)
        globalStackView.preencherSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
