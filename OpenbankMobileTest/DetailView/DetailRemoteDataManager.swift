//
//  DetailRemoteDataManager.swift
//  OpenbankMobileTest
//
//  Created by Francisco José Navarro García on 29/04/2020.
//  Copyright © 2020 AtalayaSoft OÜ. All rights reserved.
//

import Foundation

class DetailRemoteDataManager:DetailRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: DetailRemoteDataManagerOutputProtocol?
    
    func getCharacter(id: Int) {
        
        ApiFactory().character(completionHandler: { (characterResponse) in
            guard let data = characterResponse.data,
                let result = data.results else {
                    return
            }
            
            if result.count > 0 {
                let item = result[0]
                
                if let id = item.id,
                    let name = item.name,
                    let thumbnail = item.thumbnail,
                    let thumbnailPath = thumbnail.path,
                    let thumbnailExtension = thumbnail.thumbnailExtension,
                    let description =  item.resultDescription {
                    self.remoteRequestHandler?.callBackGetCharacter(with: Character(id: id,
                                                                                    name: name,
                                                                                    thumbnail: "\(thumbnailPath).\(thumbnailExtension)", description: description))
                }
            }
        }, failure: { (Error) in
            print("")
        }, id: id)
    }
}
