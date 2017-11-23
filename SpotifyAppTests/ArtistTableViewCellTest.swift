//
//  ArtistTableViewCellTest.swift
//  SpotifyAppTests
//
//  Created by Juliana Loaiza on 11/21/17.
//  Copyright © 2017 Juliana Loaiza Labrador. All rights reserved.
//

import XCTest
@testable import SpotifyApp

class ArtistTableViewCellTest: XCTestCase {
    let artistTableViewCell = ArtistTableViewCell()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCountriesAvailable(){
        XCTAssertEqual("Available in more than five countries", artistTableViewCell.countriesAvailable(6))
    }
    
    
}
