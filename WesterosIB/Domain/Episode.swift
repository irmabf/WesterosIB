//
//  Episode.swift
//  WesterosIB
//
//  Created by Irma Blanco on 03/03/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import UIKit

final class Episode {
    let title: String
    let releaseDate: Date
    weak var season: Season?
  
    init(title: String, releaseDate: Date, season: Season) {
        self.title = title
        self.releaseDate = releaseDate
        self.season = season

    }
}


// Mark: - Equatable

extension Episode: Equatable {
    static func ==(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

// Mark: - Hashable

extension Episode: Hashable {
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

// Mark: - Comparable

extension Episode: Comparable {
    static func <(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
    
}

// Mark: - ProxyForEquality

extension Episode{
    var proxyForEquality: String {
        return "\(title) \(releaseDate) "
    }
}

// Mark: - ProxyForComparison
extension Episode{
    var proxyForComparison: Date {
        return releaseDate
    }
}
