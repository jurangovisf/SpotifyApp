//
//  Login.swift
//  SpotifyAppUITests
//
//  Created by Juliana Loaiza on 11/27/17.
//  Copyright © 2017 Juliana Loaiza Labrador. All rights reserved.
//

import Foundation
import XCTest

struct Login {
    func Login(){
        let myApp = XCUIApplication()
        
        XCUIApplication().buttons["Login in Spotify"].tap()
        let safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
        
        safari.wait(for: .runningForeground, timeout: 20)
        myApp.activate()
    }
    
}

