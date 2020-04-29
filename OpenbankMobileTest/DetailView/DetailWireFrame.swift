//
//  DetailWireFrame.swift
//  OpenbankMobileTest
//
//  Created by Francisco José Navarro García on 29/04/2020.
//  Copyright © 2020 AtalayaSoft OÜ. All rights reserved.
//

import Foundation
import UIKit

class DetailWireFrame: DetailWireFrameProtocol {

    class func createDetailModule(_ character: Character) -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "DetailView")
        if let view = navController.children.first as? DetailView {
            let presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter()
            let interactor: DetailInteractorInputProtocol & DetailRemoteDataManagerOutputProtocol = DetailInteractor()
            let localDataManager: DetailLocalDataManagerInputProtocol = DetailLocalDataManager()
            let remoteDataManager: DetailRemoteDataManagerInputProtocol = DetailRemoteDataManager()
            let wireFrame: DetailWireFrameProtocol = DetailWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            presenter.character = character
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "DetailView", bundle: Bundle.main)
    }
    
}
