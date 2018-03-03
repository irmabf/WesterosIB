//
//  Season.swift
//  WesterosIB
//
//  Created by Irma Blanco on 03/03/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import UIKit


typealias Episodes = Set<Episode>

final class Season {
    let name: String
    let releaseDate: Date
    private var _episodes: Episodes
    
    init(name: String, releaseDate: Date, episode: Episode) {
        self.name = name
        self.releaseDate = releaseDate
        _episodes = Episodes()
        self.add(episode: episode)
    }
    
}

extension Season{
    func add(episode: Episode){
        _episodes.insert(episode)
    }
}

// Mark: - CustomStringConvertible
extension Season: CustomStringConvertible {
    var description: String {
        return "\(name) \(releaseDate) \(_episodes)"
    }
}

// Mark: - Equatable
extension Season: Equatable{
    static func ==(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

//Mark: - Comparable
extension Season: Comparable{
    static func <(lhs:Season,rhs:Season)->Bool{
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}


// Mark: - ProxyForEquality
extension Season {
    var proxyForEquality: String {
        return "\(name) \(releaseDate) "
    }
}

// Mark: - ProxyForComparison
extension Season {
    var proxyForComparison: Date {
        return releaseDate
    }
}
























