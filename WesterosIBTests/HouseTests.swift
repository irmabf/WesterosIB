//
//  HouseTests.swift
//  WesterosIBTests
//
//  Created by Irma Blanco on 26/02/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import XCTest
@testable import  WesterosIB

class HouseTests: XCTestCase {
    
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
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido", url: URL(string: "http://awoiaf.westeros.org/index.php/House_Lannister")!)
        robb = Person(name: "Robb", alias: "El joven lobo", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "El enano", house: lannisterHouse)
        
    }
    override func tearDown() {
        super.tearDown()
    }
    
    
    func testHouseExistence() {
        let starkSigil = Sigil(image: UIImage(), description: "Lobo Huargo")
        let stark = House(name: "Stark", sigil: starkSigil , words: "Se acerca el inivierno", url: URL(string: "http://awoiaf.westeros.org/index.php/House_Stark")!)
        
        let lannisterSigil = Sigil(image: UIImage(), description: "Leon Rampante")
        let lannister = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido", url: URL(string: "http://awoiaf.westeros.org/index.php/House_Lannister")!)
        //Given
        //When
        //Then
        XCTAssertNotNil(stark)
         XCTAssertNotNil(lannister)
    }
    
    func testSigilExistence() {
        let starkSigil = Sigil(image: UIImage(), description:"Lobo Huargo")
        XCTAssertNotNil(starkSigil)
        
        let lannisterSigil = Sigil(image: UIImage(), description:"León Rampante")
        XCTAssertNotNil(lannisterSigil)
        
        }
    
    func testAddPerson() {
        XCTAssertEqual(starkHouse.count, 0)
        
        starkHouse.add(person: robb)
        XCTAssertEqual(starkHouse.count, 1)
        
        starkHouse.add(person: robb)
        XCTAssertEqual(starkHouse.count, 1)
        
        starkHouse.add(person: arya)
        XCTAssertEqual(starkHouse.count, 2)
        
        starkHouse.add(person: tyrion)
        XCTAssertEqual(starkHouse.count, 2)
        
        let cersei = Person(name: "Cersei", house: lannisterHouse)
        let jaime = Person(name: "Jaime", alias: "El Matarreyes", house: lannisterHouse)
        
        lannisterHouse.add(persons: cersei, jaime, jaime, jaime, arya )
        XCTAssertEqual(lannisterHouse.count, 2)
    }
    func testHouseEquality() {
        //Identidad
        XCTAssertEqual(starkHouse, starkHouse)
        // Igualdad
        let jinxed = House(name: "Stark", sigil: starkSigil , words: "Se acerca el inivierno",url: URL(string: "http://awoiaf.westeros.org/index.php/House_Stark")!)
        XCTAssertEqual(jinxed, starkHouse)
        //Desigualdad
        XCTAssertNotEqual(starkHouse, lannisterHouse)
    }
    
    //Comprobar que nuestra tambien tiene un valor de hash, es decir
    //Que el valor del hash de la casa sea not nil
    func testHashable() {
        XCTAssertNotNil(starkHouse.hashValue)
    }
    //En la app tendre que ordenar las casas y para poder ordenar un objeto o tipo necesito
    //el protocolo comparable, determinar que un objeto es mas grande que el otro
    func testHouseComparison() {
        XCTAssertLessThan(lannisterHouse,starkHouse )
    }
    
    func testHouseReturnsSortedArrayOfMembers() {
        starkHouse.add(persons: robb, arya)
        
        XCTAssertEqual(starkHouse.sortedMembers, [arya, robb])
    }
    
}


































