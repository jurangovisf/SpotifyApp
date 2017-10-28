//
//  RepositoryLocator.swift
//  SpotifyApp
//
//  Created by Juliana Loaiza Labrador on 27/10/17.
//  Copyright © 2017 Juliana Loaiza Labrador. All rights reserved.
//

import Foundation


private let sharedInstance = RepositoryLocator()

public class RepositoryLocator {
    
    static let sharedInstance = RepositoryLocator()
    
    var use_test_repository: Bool
    
    class var sharedDispatchInstance: RepositoryLocator {
        struct Static {
            static var onceToken = NSUUID().uuidString
            static var instance: RepositoryLocator? = nil
        }
        DispatchQueue.once(token: Static.onceToken) {
            Static.instance = RepositoryLocator()
        }
        return Static.instance!
    }
    
    class var sharedStructInstance: RepositoryLocator {
        struct Static {
            static let instance = RepositoryLocator()
        }
        return Static.instance
    }
    
    init() {
        use_test_repository =  "USE_TEST_REPO".localizedBool
    }
    
    func artistRepository() -> IArtistRepository {
        if (use_test_repository) {
            return ArtistRepositoryTest.sharedInstance
        } else {
            return ArtistRepository.sharedInstance
        }
    }
    
}
