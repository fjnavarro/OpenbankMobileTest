//
//  DetailProtocols.swift
//  OpenbankMobileTest
//
//  Created by Francisco José Navarro García on 29/04/2020.
//  Copyright © 2020 AtalayaSoft OÜ. All rights reserved.
//

import Foundation
import UIKit

protocol DetailViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: DetailPresenterProtocol? { get set }
    
    func showDetailCharacter(_ character: Character)
    func loadActivity()
    func stopActivity()
}

protocol DetailWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createDetailModule(_ character: Character) -> UIViewController
}

protocol DetailPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: DetailViewProtocol? { get set }
    var interactor: DetailInteractorInputProtocol? { get set }
    var wireFrame: DetailWireFrameProtocol? { get set }
    
    var character: Character? { get set }
    
    func viewDidLoad()
}

protocol DetailInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func callBackGetCharacter(with character: Character)
}

protocol DetailInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: DetailInteractorOutputProtocol? { get set }
    var localDatamanager: DetailLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: DetailRemoteDataManagerInputProtocol? { get set }
    
    func updateCharacterInfo(id: Int)
}

protocol DetailDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol DetailRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: DetailRemoteDataManagerOutputProtocol? { get set }
    func getCharacter(id: Int)
}

protocol DetailRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func callBackGetCharacter(with character: Character)
}

protocol DetailLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
