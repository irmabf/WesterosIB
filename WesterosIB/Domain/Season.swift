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
    let nameOfSeason: String
    var releaseDate: Date
    private var _episodes: Episodes
    private var _numEpisodes: Int
    
    init(seasonName: String, airDate: Date) {
        self.nameOfSeason = seasonName
        self.releaseDate = airDate
        
        _episodes = Episodes()
        _numEpisodes = _episodes.count
    }
}


// MARK: - Count Episodes
extension Season {
    var count: Int {
        return _numEpisodes
    }
}

extension Season {
    var episodes: [Episode] {
        let arrayEpisodes = Array(_episodes)
        return arrayEpisodes
    }
}

// MARK: - Add
extension Season {
    func add(episode: Episode) {
        _episodes.insert(episode)
        _numEpisodes = _episodes.count
    }
    
    func add(episodes: Episode...) {
        for episode in episodes {
            add(episode: episode)
        }
    }
}

// Mark: - CustomStringConvertible
extension Season: CustomStringConvertible {
    var description: String {
        return "\(nameOfSeason) \(releaseDate) \(_episodes)"
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

// Mark: - Hashable

extension Season: Hashable{
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

// Mark: - ProxyForEquality
extension Season {
    var proxyForEquality: String {
        return "\(nameOfSeason) \(releaseDate) "
    }
}

// Mark: - ProxyForComparison
extension Season {
    var proxyForComparison: Date {
        return releaseDate
    }
}
























