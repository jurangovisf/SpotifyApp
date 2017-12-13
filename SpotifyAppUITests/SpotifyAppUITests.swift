//
//  SpotifyAppUITests.swift
//  SpotifyAppUITests
//
//  Created by Juliana Loaiza Labrador on 27/10/17.
//  Copyright © 2017 Juliana Loaiza Labrador. All rights reserved.
//

import XCTest
import XCTest_Gherkin

class SpotifyAppUITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = true
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
//    func testSearchListForValidArtist(){
//        Given("I tap Login Button and Login in Spotify Account")
//        When("I enter artist search for Linkin Park")
//        Then("I wait to see if the artist was found")
//    }
    
//    func testSearchListForInvalidArtist(){
//        Given("I tap Login Button and Login in Spotify Account")
//        When("I enter artist search for JASKDJQKWENDA")
//        Then("I wait to see if the artist was not found")
//    }
    
}
