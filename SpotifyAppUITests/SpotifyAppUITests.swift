//
//  SpotifyAppUITests.swift
//  SpotifyAppUITests
//
//  Created by Juliana Loaiza Labrador on 27/10/17.
//  Copyright © 2017 Juliana Loaiza Labrador. All rights reserved.
//

import XCTest

class SpotifyAppUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let myApp = XCUIApplication()

        XCUIApplication().buttons["Login in Spotify"].tap()
        let safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")

        safari.wait(for: .runningForeground, timeout: 20)
        myApp.activate()
        
        let searchArtistSearchField = myApp.searchFields["Search Artist"]
        searchArtistSearchField.tap()
        searchArtistSearchField.typeText("Linkin Park")
        sleep(10)
        XCTAssertTrue(myApp.staticTexts["One More Light"].exists, "Encontró Linkin Park")
        
    }

}
