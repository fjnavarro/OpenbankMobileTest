//
//  EntityTestTests.swift
//  OpenbankMobileTestTests
//
//  Created by Francisco José Navarro García on 29/04/2020.
//  Copyright © 2020 AtalayaSoft OÜ. All rights reserved.
//

import XCTest
@testable import OpenbankMobileTest

class CharacterEntityTests: XCTestCase {
    
    func testEntitySetGet() {
        let character = CharacterM(id: 1017100,
                                  name: "A-Bomb (HAS)",
                                  thumbnail: "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16.jpg",
                                  description: "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! ")
        
        XCTAssertEqual(character.id, 1017100)
        XCTAssertEqual(character.name, "A-Bomb (HAS)")
        XCTAssertEqual(character.thumbnail, "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16.jpg")
        XCTAssertEqual(character.description, "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! ")
    }
    
}
