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
    let wikiURL: URL
    private var _members: Members
    
    init(name: String, sigil: Sigil, words: Words, url: URL) {
        self.name = name
        self.sigil = sigil
        self.words = words
        self.wikiURL = url
        _members = Members()
    }
    
}

extension House{
    var count: Int {
        return _members.count
    }
    func add(person: Person) {
        guard person.house == self else {
            return
        }
        _members.insert(person)
    }
    
    func add(persons: Person...) {
        //Aqui persons es de tipo  [Person]
        /*for person in persons {
            add(person: person)
        }*/
        persons.forEach{ add(person: $0) }
        
    }
}
// Mark: - Proxy
extension House {
    var proxyForEquality: String {
         return "\(name) \(words) \(count) "
    }
}

// Mark: - ProxyForEquality
extension House {
    var proxyForComparison: String {
        //importante, me da igual que el nombre me lo pasen en may, min etc
        return name.uppercased()
    }
}

extension House: Equatable {
    static func ==(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }

}

// Mark: - Hashable

extension House: Hashable{
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

// Mark: - Comparable
extension House: Comparable{
    static func <(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
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



