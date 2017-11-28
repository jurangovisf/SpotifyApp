//
//  SearchArtist.swift
//  SpotifyAppUITests
//
//  Created by Juliana Loaiza on 11/24/17.
//  Copyright © 2017 Juliana Loaiza Labrador. All rights reserved.
//

import XCTest
import Foundation
import XCTest_Gherkin



struct SearchArtist{
    
    func userSearchForLinkinPark(){
        let myApp = XCUIApplication()
        
        let searchArtistSearchField = myApp.searchFields["Search Artist"]
        searchArtistSearchField.tap()
        searchArtistSearchField.typeText("Linkin")
    }
    func userSearchArtistNotFound(){
        let myApp = XCUIApplication()
        
        let searchArtistSearchField = myApp.searchFields["Search Artist"]
        searchArtistSearchField.tap()
        searchArtistSearchField.typeText("JASKDJQKWENDA")
    }
    
    func validateFoundArtist(){
        let myApp = XCUIApplication()
        XCTAssertTrue(myApp.staticTexts["One More Light"].exists, "Encontro linkin park")
    }
    func validateNotFoundArtist(){
        let myApp = XCUIApplication()
        XCTAssertTrue(myApp.staticTexts["Artist not found"].exists, "No encontro linkin park")
    }
}
