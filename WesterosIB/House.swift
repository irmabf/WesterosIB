//
//  House.swift
//  WesterosIB
//
//  Created by Irma Blanco on 26/02/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import UIKit


typealias Words = String
typealias Members = Set<Person>

// Mark: - Title

final class House {
    
    let name: String
    let sigil: Sigil
    let words: Words
    private var _members: Members
    
    init(name: String, sigil: Sigil, words: Words) {
        self.name = name
        self.sigil = sigil
        self.words = words
        _members = Members()
    }
    
}

extension House{
    var count: Int {
        return _members.count
    }
    func add(person: Person) {
        guard person.house.name == self.name else {
            return
        }
        _members.insert(person)
    }
}
// Mark: - Proxy
extension House {
    var proxyForEquality: String {
         return "\(name) \(words) \(count) "
    }
}

extension House: Equatable {
    static func ==(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
    
    
}
final class Sigil {
    let image: UIImage
    let description: String
    
    init(image: UIImage, description: String) {
        self.image = image
        self.description = description
    }
}



