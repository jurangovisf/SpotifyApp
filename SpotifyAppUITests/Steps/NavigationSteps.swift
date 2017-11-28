//
//  NavigationSteps.swift
//  SpotifyAppUITests
//
//  Created by Juliana Loaiza on 11/24/17.
//  Copyright © 2017 Juliana Loaiza Labrador. All rights reserved.
//

import Foundation
import XCTest_Gherkin
import XCTest

class NavigationSteps: StepDefiner{
    override func defineSteps() {
        step("I tap Login Button and Login in Spotify Account"){
            let login = Login()
            login.Login()
        }
    }
}

