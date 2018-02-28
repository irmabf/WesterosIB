//
//  RespositoryTests.swift
//  WesterosIBTests
//
//  Created by Irma Blanco on 28/02/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import XCTest
@testable import  WesterosIB
class RespositoryTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLocalRepositoryCreation() {
        let local = Repository.local
        XCTAssertNotNil(local)
    }
    
    func testLocalRepositoryHousesCreation() {
        let houses = Repository.local.houses
        XCTAssertNotNil(houses)
        XCTAssertEqual(houses.count, 2)
    }
    
}
