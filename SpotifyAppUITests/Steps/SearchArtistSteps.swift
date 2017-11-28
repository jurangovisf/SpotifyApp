//
//  File.swift
//  SpotifyAppUITests
//
//  Created by Juliana Loaiza on 11/24/17.
//  Copyright © 2017 Juliana Loaiza Labrador. All rights reserved.
//

import Foundation
import XCTest_Gherkin

class SearchArtistSteps: StepDefiner{
    override func defineSteps() {
        step("I enter artist search for Linkin Park") {
            let searchArtist = SearchArtist()
            searchArtist.userSearchForLinkinPark()
        }
        step("I enter artist search for JASKDJQKWENDA") {
            let searchArtist = SearchArtist()
            searchArtist.userSearchArtistNotFound()
        }
    }
}

