//
//  AlbumTest.swift
//  SpotifyAppTests
//
//  Created by Juliana Loaiza on 11/15/17.
//  Copyright © 2017 Juliana Loaiza Labrador. All rights reserved.
//

import XCTest
import ObjectMapper
@testable import SpotifyApp

class AlbumTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit_Album(){
        let JsonAlbum = "[{\"album_type\": \"album\", \"available_markets\": [\"AD\", \"AR\", \"AT\", \"AU\", \"BE\", \"BG\", \"BO\", \"BR\", \"CA\", \"CH\", \"CL\", \"CO\"], \"external_urls\": {\"spotify\": \"https://open.spotify.com/album/5Eevxp2BCbWq25ZdiXRwYd\"}, \"id\": \"5Eevxp2BCbWq25ZdiXRwYd\", \"images\": [{\"height\": 640, \"url\": \"https://i.scdn.co/image/24b1591bc4ecc8fe201465a9c1bf1af96c93224d\", \"width\": 640 }, {\"height\": 300, \"url\": \"https://i.scdn.co/image/4a5a7737db8a500dd89ff8dd5bb9d993f481c97b\", \"width\": 300 }, {\"height\": 64, \"url\": \"https://i.scdn.co/image/8dffc0613d103efc7255ce435f6ab7ebec022f84\", \"width\": 64 }], \"name\": \"One More Light\"}]"
        let albums =  Mapper<Album>().mapArray(JSONString: JsonAlbum)
        let album = albums![0]
        
        XCTAssertEqual(album.name, "One More Light")
        XCTAssertEqual(album.available_markets![0], "AD")
        XCTAssertEqual(album.cellHeight, 528)
        XCTAssertEqual(album.externalsURL, "https://open.spotify.com/album/5Eevxp2BCbWq25ZdiXRwYd")
        
    }
    
    
}
