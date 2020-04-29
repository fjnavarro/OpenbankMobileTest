//
//  DetailPresenter.swift
//  OpenbankMobileTest
//
//  Created by Francisco José Navarro García on 29/04/2020.
//  Copyright © 2020 AtalayaSoft OÜ. All rights reserved.
//

import Foundation

class DetailPresenter  {
    
    // MARK: Properties
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var wireFrame: DetailWireFrameProtocol?
    var character: CharacterM?
    
}

extension DetailPresenter: DetailPresenterProtocol {
    // presenter methods
    func viewDidLoad() {
        if let character = character {
            view?.loadActivity()
            
            interactor?.updateCharacterInfo(id: character.id)
        }
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    // interactor output methods
    func callBackGetCharacter(with character: CharacterM) {
        view?.stopActivity()
        
        view?.showDetailCharacter(character)
    }
}
