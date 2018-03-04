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
    
    func testRepositoryCreateHouses() {
        XCTAssertNotNil(houses)
        XCTAssertEqual(houses.count, 3)
    }
    
    func testResitoryReturnArrayOfHouses() {
        XCTAssertEqual(houses, houses.sorted())
    }
    
    func testRepositoryReturnsHouseByCase() {
        let stark = Repository.local.house(name: "STArk")
        XCTAssertEqual(stark?.name, "Stark")
        let other = Repository.local.house(name: "Other")
        XCTAssertNil(other?.name)
    }
    
    func testRepositoryFilterHouseBy() {
        let filtered = Repository.local.houseFilter(filterBy: {$0.words.contains("acerca")})
        XCTAssertEqual(filtered.count, 1)
    }
    
    func testRepositoryCreateSeason() {
        XCTAssertEqual(seasons.count, 7)
    }
    
    func testResitoryReturnArrayOfSeasons() {
        XCTAssertEqual(seasons, seasons.sorted())
    }
    
    
    func testRepositoryReturnHouseByCase() {
        let stark = Repository.local.house(named: .Lannister)
        XCTAssertEqual(stark?.name, "Lannister")
    }
}

