//
//  SeasonTest.swift
//  WesterosIBTests
//
//  Created by Irma Blanco on 03/03/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import XCTest
@testable import WesterosIB
class SeasonTest: XCTestCase {
    var seasonOne = Season(name: "First Season", releaseDate: Date(), episode: "Winter Is Coming" )
    var seasonTwo = Season(name: "Second Season", releaseDate: Date(), episode: "The North Remembers")
     var episodeOne = Episode()
     var episodeTwo = Episode()
    
    override func setUp() {
         super.setUp()
    }
    
    override func tearDown() {

        super.tearDown()
    }
    
    func testSeasonExistence(){
     
        XCTAssertNotNil(seasonOne)
    }
    
    func testSeasonHasAtLeastOneEpisode(){
      
        XCTAssertGreaterThan(seasonOne.count, 0)
    }
    
    func testSeasonEquality(){
        XCTAssertEqual(seasonOne, seasonOne)
        XCTAssertNotEqual(seasonOne, seasonTwo)
       
    }
    
  
    
}
