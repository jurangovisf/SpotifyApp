//
//  ArtistTest.swift
//  SpotifyAppTests
//
//  Created by Juliana Loaiza on 11/15/17.
//  Copyright © 2017 Juliana Loaiza Labrador. All rights reserved.
//

import XCTest


import XCTest
import ObjectMapper
@testable import SpotifyApp

class ArtistTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit_Artist(){
        let ArtistsJson = "[{\"external_urls\": {\"spotify\": \"https://open.spotify.com/artist/6XyY86QOPPrYVGvF9ch6wz\"}, \"followers\": {\"href\": null, \"total\": 5826134 }, \"genres\": [\"alternative metal\", \"nu metal\", \"post-grunge\", \"rap metal\"], \"href\": \"https://api.spotify.com/v1/artists/6XyY86QOPPrYVGvF9ch6wz\", \"id\": \"6XyY86QOPPrYVGvF9ch6wz\", \"images\": [{\"height\": 640, \"url\": \"https://i.scdn.co/image/1685533969d5b68cbc630f991e873bd6467f1814\", \"width\": 640 }, {\"height\": 320, \"url\": \"https://i.scdn.co/image/f759994946aa42851e5293083f472c96c1753105\", \"width\": 320 }, {\"height\": 160, \"url\": \"https://i.scdn.co/image/0b0925b544b46d90a549f25a7f754ce6e59e6be2\", \"width\": 160 }], \"name\": \"Linkin Park\", \"popularity\": 92, \"type\": \"artist\", \"uri\": \"spotify:artist:6XyY86QOPPrYVGvF9ch6wz\"}]"
        
        let artists =  Mapper<Artist>().mapArray(JSONString: ArtistsJson)
        let artist = artists![0]
        XCTAssertEqual(artist.id, "6XyY86QOPPrYVGvF9ch6wz")
        XCTAssertEqual(artist.name, "Linkin Park")
        XCTAssertEqual(artist.popularity, 92)
        XCTAssertEqual(artist.totalFollowers, 5826134)
        
        XCTAssertNotEqual(artist.id, "6XyY86QOPPrYVGvF9ch6","Fail")
        XCTAssertNotEqual(artist.name, "Beatles", "Fail")
        XCTAssertNotEqual(artist.popularity, 80, "Fail")
        XCTAssertNotEqual(artist.totalFollowers, 234234, "Fail")
    }
    
}

