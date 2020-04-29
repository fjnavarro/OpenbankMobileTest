//
//  HomeInteractor.swift
//  OpenbankMobileTest
//
//  Created by Francisco José Navarro García on 28/04/2020.
//  Copyright © 2020 AtalayaSoft OÜ. All rights reserved.
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: HomeInteractorOutputProtocol?
    var localDatamanager: HomeLocalDataManagerInputProtocol?
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?
    
    func getCharacters() {
        remoteDatamanager?.getCharacters()
    }
}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
    // use case methods
    func callBackGetCharacters(with characters: [Character]) {
        presenter?.callBackGetCharacters(with: characters)
    }
    
    func callBackGetCharacters(withError error: String?) {
        presenter?.callBackGetCharacters(withError: error)
    }
}
