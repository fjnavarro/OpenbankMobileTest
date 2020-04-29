//
//  HomePresenter.swift
//  OpenbankMobileTest
//
//  Created by Francisco José Navarro García on 28/04/2020.
//  Copyright © 2020 AtalayaSoft OÜ. All rights reserved.
//

import Foundation

class HomePresenter  {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
    
}

extension HomePresenter: HomePresenterProtocol {
    // presenter methods
    func viewDidLoad() {
        view?.loadActivity()
        
        interactor?.getCharacters()
    }
    
    func showDetail(_ character: CharacterM) {
        if let view = view {
            wireFrame?.showDetail(character,
                                  from: view)
        }
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    // interactor output methods
    func callBackGetCharacters(with characters: [CharacterM]) {
        view?.stopActivity()
        
        view?.updateCharacters(characters)
    }
    
    func callBackGetCharacters(withError error: String?) {
        view?.stopActivity()
        
        view?.showError(error)
    }
}
