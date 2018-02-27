//
//  Character.swift
//  WesterosIB
//
//  Created by Irma Blanco on 26/02/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import Foundation

final class Person {
    let name: String
    let house: House
    private let _alias: String? //Esta propiedad privada es la opcional
    
    /*var alias: String {
        if let _alias = _alias {
            //Existe y esta en _alias
            return _alias
        }else{
            return ""
        }
    }*/
    
    var alias: String {
        return _alias ?? ""
    }
    
    
    init(name: String, alias: String? = nil, house: House) {
        self.name = name
        _alias = alias
        self.house = house
    }
}

extension Person {
    var fullName: String {
        return "\(name) \(house.name)"
    }
}
    

//  MARK - Proxies
extension Person{
    var proxy: String {
        return "\(name) \(alias) \(house.name)"
    }
}
//  MARK - Hashable
extension Person: Hashable {
   var hashValue: Int {
        return proxy.hashValue
    }
}
//  MARK - Equatable
extension Person: Equatable {
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}
































