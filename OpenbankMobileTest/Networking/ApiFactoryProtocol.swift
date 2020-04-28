//
//  ApiFactoryProtocol.swift
//  OpenbankMobileTest
//
//  Created by Francisco José Navarro García on 28/04/2020.
//  Copyright © 2020 AtalayaSoft OÜ. All rights reserved.
//

import Foundation

protocol ApiFactoryProtocol {
    func characters(completionHandler:@escaping (_ characters:CharactersResponse)->Void, failure:@escaping (_ error: String?)->Void)
}
