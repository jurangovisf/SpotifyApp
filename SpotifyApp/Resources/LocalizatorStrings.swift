//
//  LocalizatorStrings.swift
//  SpotifyApp
//
//  Created by Juliana Loaiza Labrador on 27/10/17.
//  Copyright © 2017 Juliana Loaiza Labrador. All rights reserved.
//

import Foundation

private class Localizator {
    
    static let sharedInstance = Localizator()
    
    lazy var localizableDictionary: NSDictionary = {
        if let path = Bundle(for: type(of: self)).path(forResource: "Localizable", ofType: "plist") {
            return NSDictionary(contentsOfFile: path)!
        }
        fatalError("Localizable file NOT found")
    }()
    
    func localize(string: String) -> String {
        guard let localizedString = (localizableDictionary.value(forKey: string) as AnyObject) as? String else {
            //assertionFailure("Missing translation for: \(string)")
            return string
        }
        return localizedString
    }
    
    func localize(string: String) -> NSDictionary {
        guard let localizedDictionary = (localizableDictionary.value(forKey: string) as AnyObject) as? NSDictionary else {
            //assertionFailure("Missing translation for: \(string)")
            return NSDictionary()
        }
        return localizedDictionary
    }
    
    func localize(string: String) -> Bool {
        guard let localizedBool = (localizableDictionary.value(forKey: string) as AnyObject) as? Bool else {
            assertionFailure("Missing translation for: \(string)")
            return false
        }
        return localizedBool
    }
}

public extension String {
    var localized: String {
        return Localizator.sharedInstance.localize(string: self)
    }
    
    var localizedDictionary: NSDictionary {
        return Localizator.sharedInstance.localize(string: self)
    }
    
    var localizedBool: Bool {
        return Localizator.sharedInstance.localize(string: self)
    }
}

