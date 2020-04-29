//
//  ApiFactory+Characters.swift
//  OpenbankMobileTest
//
//  Created by Francisco José Navarro García on 28/04/2020.
//  Copyright © 2020 AtalayaSoft OÜ. All rights reserved.
//

import Foundation
import Alamofire

extension ApiFactory {
    func characters(completionHandler: @escaping(_ characters:CharactersResponse)->Void, failure: @escaping(_ error: String?)->Void) { // Mirar el error para que sea personalizado
        let urlString = "\(baseUrl)\(KApiFactory_CharactersEndpoint)?ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
        
        let request = AF.request(urlString,
                                 method: .get)
        
        request.validate(statusCode: 200..<300)
            .responseDecodable(of: CharactersResponse.self) { (response) in
                guard let charactersResponse = response.value else {
                    // Error
                    failure("\(String(describing: response.error))")
                    return
                }
                
                completionHandler(charactersResponse)
        }
    }
    
    func character(completionHandler:@escaping (_ character:CharactersResponse)->Void, failure:@escaping (_ error: String?)->Void, id: Int) {
        let urlString = "\(baseUrl)\(KApiFactory_CharacterEndpoint)\(id)?ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
        
        let request = AF.request(urlString,
                                 method: .get)
        
        request.validate(statusCode: 200..<300)
            .responseDecodable(of: CharactersResponse.self) { (response) in
                guard let characterResponse = response.value else {
                    // Error
                    failure("\(String(describing: response.error))")
                    return
                }
                
                completionHandler(characterResponse)
        }
    }
}
