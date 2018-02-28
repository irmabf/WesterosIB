//
//  CharacterTests.swift
//  WesterosIBTests
//
//  Created by Irma Blanco on 26/02/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import XCTest
@testable import WesterosIB
class PersonTests: XCTestCase {
    var starkSigil: Sigil!
    var lannisterSigil: Sigil!
    
    var starkHouse: House!
    var lannisterHouse: House!
    
    var robb: Person!
    var arya: Person!
    var tyrion: Person!
    
   
    override func setUp() {
        super.setUp()
        starkSigil = Sigil(image: UIImage(), description: "Lobo Huargo")
        lannisterSigil = Sigil(image: UIImage(), description: "Leon Rampante")
        starkHouse = House(name: "Stark", sigil: starkSigil , words: "Se acerca el inivierno", url: URL(string: "http://awoiaf.westeros.org/index.php/House_Stark")!)
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido",url: URL(string: "http://awoiaf.westeros.org/index.php/House_Lannister")!)
        robb = Person(name: "Robb", alias: "El joven lobo", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "El enano", house: lannisterHouse)
        
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCharacterExistence() {
        XCTAssertNotNil(robb)
        XCTAssertNotNil(arya)
    }
    
    func testFullName() {
        XCTAssertEqual(robb.fullName, "Robb Stark")
    }
    
    //Comprabar que dos personas son iguales o son diferentes
    func testPersonEquality() {
        //Identidad
        XCTAssertEqual(tyrion, tyrion)
        // Igualdad
        let enano = Person(name: "Tyrion", alias: "El enano", house: lannisterHouse)
        XCTAssertEqual(enano, tyrion)
        
        //Desigualdad
        XCTAssertNotEqual(tyrion, arya)
    }
}












































