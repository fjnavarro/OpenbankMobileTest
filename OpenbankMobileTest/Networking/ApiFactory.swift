//
//  ApiFactory.swift
//  OpenbankMobileTest
//
//  Created by Francisco José Navarro García on 28/04/2020.
//  Copyright © 2020 AtalayaSoft OÜ. All rights reserved.
//

import Foundation
import CryptoSwift

class ApiFactory: ApiFactoryProtocol {
    let KMarvelFactory_CharactersEndpoint = "/public/characters"
    let publicKey = "ba0bd26c9846c8515c8954202fa5ae75"
    let privateKey = "de795b1f5cc85d4132b50b09249ec347372a7b55"
    let baseUrl = "http://gateway.marvel.com/v1"
    
    var _ts: String = ""
    var ts: String {
        get {
            if _ts.isEmpty {
                _ts = "\(Date().timeIntervalSince1970)"
            }
            
            return _ts
        }
    }
    var hash: String {
        get {
            return "\(ts)\(privateKey)\(publicKey)".md5()
        }
    }
}
