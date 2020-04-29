//
//  Character.swift
//  OpenbankMobileTest
//
//  Created by Francisco José Navarro García on 28/04/2020.
//  Copyright © 2020 AtalayaSoft OÜ. All rights reserved.
//

import Foundation

struct Character  {
    let id: Int
    let name: String
    let thumbnail: String
    let description: String
    
    init(id: Int, name: String, thumbnail: String) {
        self.init(id: id, name: name, thumbnail: thumbnail, description: "")
    }
    
    init(id: Int, name: String, thumbnail: String, description: String) {
        self.id = id
        self.name = name
        self.thumbnail = thumbnail
        self.description = description
    }
}
