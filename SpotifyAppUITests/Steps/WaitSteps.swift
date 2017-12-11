//
//  WaitSteps.swift
//  SpotifyAppUITests
//
//  Created by Juliana Loaiza on 11/27/17.
//  Copyright © 2017 Juliana Loaiza Labrador. All rights reserved.
//

import Foundation
import XCTest
import XCTest_Gherkin


class WaitSteps: StepDefiner{
    override func defineSteps() {
        step("I wait to see if the artist was found"){
            let searchArtist = SearchArtist()
            searchArtist.validateFoundArtist()
        }
        step("I wait to see if the artist was not found"){
            let searchArtist = SearchArtist()
            searchArtist.validateNotFoundArtist()
        }
    }
}

