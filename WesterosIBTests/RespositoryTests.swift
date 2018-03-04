//
//  RespositoryTests.swift
//  WesterosIBTests
//
//  Created by Irma Blanco on 28/02/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import XCTest
@testable import WesterosIB

class RepositoryTest: XCTestCase {
    
    var houses: [House]!
    var seasons: [Season]!
    
    override func setUp() {
        super.setUp()
        houses = Repository.local.houses
        seasons = Repository.local.seasons
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRepositoryExistence() {
        let data = Repository.local
        XCTAssertNotNil(data)
    }
    
    func testRepositoryHousesCreation() {
        XCTAssertNotNil(houses)
        XCTAssertEqual(houses.count, 3)
    }
    
    func testResitoryReturnSortedArrayOfHouses() {
        XCTAssertEqual(houses, houses.sorted())
    }
    
    func testRepositoryReturnsHouseByCaseIntensensitively() {
        let stark = Repository.local.house(name: "StArk")
        XCTAssertEqual(stark?.name, "Stark")
        let other = Repository.local.house(name: "Other")
        XCTAssertNil(other?.name)
    }
    
    func testRepositoryFilteringHouseBy() {
        let filtered = Repository.local.houseFilter(filterBy: {$0.words.contains("invierno")})
        XCTAssertEqual(filtered.count, 1)
    }
    
    func testRepositorySeasonCreation() {
        XCTAssertEqual(seasons.count, 7)
    }
    
    func testResitoryReturnSortedArrayOfSeasons() {
        XCTAssertEqual(seasons, seasons.sorted())
    }
    
    func testRepositoryFilteringSeasonBy() {
        let filtered = Repository.local.seasonFilter(filterBy: {$0.nameOfSeason.contains("1")})
        XCTAssertEqual(filtered.count, 1)
    }
    
    func testRepositoryReturnHouseByCaseTypeSafe() {
        let stark = Repository.local.house(named: .Stark)
        XCTAssertEqual(stark?.name, "Stark")
    }
}

