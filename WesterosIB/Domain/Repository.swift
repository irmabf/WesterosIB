//
//  Repository.swift
//  WesterosIB
//
//  Created by Irma Blanco on 28/02/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import UIKit

/*
  -- Creamos una clase Repository que tiene una propiedad estatica que se llama local
 -- local es de tipo LocalFactory, que es otra clase implementada debajo
 -- La clase LocalFactory se conforma al protocolo HouseFactory
 -- El protocolo HouseFactory aporta una propiedad de tipo array de casas
 -- Si quiero obtener las casas en mi appdelegate tengo que usear repository
 */
final class Repository {
    static let local = LocalFactory()
}

protocol  HouseFactory {
    var houses: [House] { get }
}

final class LocalFactory: HouseFactory{
    var houses: [House] {
        
        //Houses creation here
        let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Lobo Huargo")
        let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Leon Rampante")
        
        let starkHouse = House(name: "Stark", sigil: starkSigil , words: "Se acerca el inivierno")
        let lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido")
        
        let robb = Person(name: "Robb", alias: "El joven lobo", house: starkHouse)
        let arya = Person(name: "Arya", house: starkHouse)
        let tyrion = Person(name: "Tyrion", alias: "El enano", house: lannisterHouse)
        
        //Add characters to houses
        starkHouse.add(person: arya)
        starkHouse.add(person: robb)
        starkHouse.add(person: tyrion)
        
        return [starkHouse, lannisterHouse]
    }
}
