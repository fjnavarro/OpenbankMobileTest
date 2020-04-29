//
//  DetailInteractor.swift
//  OpenbankMobileTest
//
//  Created by Francisco José Navarro García on 29/04/2020.
//  Copyright © 2020 AtalayaSoft OÜ. All rights reserved.
//

import Foundation

class DetailInteractor: DetailInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: DetailInteractorOutputProtocol?
    var localDatamanager: DetailLocalDataManagerInputProtocol?
    var remoteDatamanager: DetailRemoteDataManagerInputProtocol?

    func updateCharacterInfo(id: Int) {
        remoteDatamanager?.getCharacter(id: id)
    }
}

extension DetailInteractor: DetailRemoteDataManagerOutputProtocol {
    // use case methods
    func callBackGetCharacter(with character: Character) {
        presenter?.callBackGetCharacter(with: character)
    }
}
