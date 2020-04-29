//
//  HomeProtocols.swift
//  OpenbankMobileTest
//
//  Created by Francisco José Navarro García on 28/04/2020.
//  Copyright © 2020 AtalayaSoft OÜ. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: HomePresenterProtocol? { get set }
    
    func updateCharacters(_ characters: [Character])
    func loadActivity()
    func stopActivity()
}

protocol HomeWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createHomeModule() -> UIViewController
    
    func showDetail(_ character: Character, from view: HomeViewProtocol)
}

protocol HomePresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var wireFrame: HomeWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func showDetail(_ character: Character)
}

protocol HomeInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func callBackGetCharacters(with characters: [Character])
}

protocol HomeInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: HomeInteractorOutputProtocol? { get set }
    var localDatamanager: HomeLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol? { get set }
    
    func getCharacters()
}

protocol HomeDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol HomeRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol? { get set }
    func getCharacters()
}

protocol HomeRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func callBackGetCharacters(with characters: [Character])
}

protocol HomeLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
