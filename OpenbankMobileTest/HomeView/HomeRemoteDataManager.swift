//
//  HomeRemoteDataManager.swift
//  OpenbankMobileTest
//
//  Created by Francisco José Navarro García on 28/04/2020.
//  Copyright © 2020 AtalayaSoft OÜ. All rights reserved.
//

import Foundation

class HomeRemoteDataManager:HomeRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol?
    
    func getCharacters() {
        
        ApiFactory().characters(completionHandler: { (charactersResponse) in
            print("")
            
            var characters = [Character]()
            
            guard let data = charactersResponse.data,
                let results = data.results else {
                return
            }
            
            for item in results {
                if let id = item.id,
                    let name = item.name,
                    let thumbnail = item.thumbnail,
                    let thumbnailPath = thumbnail.path,
                    let thumbnailExtension = thumbnail.thumbnailExtension {
                    characters.append(Character(id: id,
                                                name: name,
                                                thumbnail: "\(thumbnailPath).\(thumbnailExtension)"))
                }
            }
            
            self.remoteRequestHandler?.callBackGetCharacters(with: characters)
        }) { (Error) in
            self.remoteRequestHandler?.callBackGetCharacters(withError: Error)
        }
//        }
    }
    
}
