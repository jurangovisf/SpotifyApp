//
//  ArtistRepositoryTest.swift
//  SpotifyApp
//
//  Created by Juliana Loaiza Labrador on 27/10/17.
//  Copyright © 2017 Juliana Loaiza Labrador. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

private let sharedInstance = ArtistRepositoryTest()

class ArtistRepositoryTest: IArtistRepository{
    static let sharedInstance = ArtistRepositoryTest()
    
    class var sharedDispatchInstance: ArtistRepositoryTest {
        struct Static {
            static var onceToken = NSUUID().uuidString
            static var instance: ArtistRepositoryTest? = nil
        }
        DispatchQueue.once(token: Static.onceToken) {
            Static.instance = ArtistRepositoryTest()
        }
        return Static.instance!
    }
    
    class var sharedStructInstance: ArtistRepositoryTest {
        struct Static {
            static let instance = ArtistRepositoryTest()
        }
        return Static.instance
    }
    
    func getArtist(_ artistName: String?,token: String?, completionHandler: @escaping ([Artist]?, NSError?) -> Void) {
        let artists =  Mapper<Artist>().mapArray(JSONString: ArtistsJson)
        completionHandler(artists, nil)
        //        let error = Mapper<Message>().map(JSONString: ErrorJson)
        //        let message = NSError(domain: "com.juliana.spotify.app", code: (error?.status)!, userInfo: ["message":error?.message])
        //        completionHandler(nil, message)
        
    }
    func getAlbums(_ id: String?,token: String?, completionHandler: @escaping ([Album]?, NSError?) -> Void) {
        let albums =  Mapper<Album>().mapArray(JSONString: AlbumsJson)
        completionHandler(albums, nil)
        //                let error = Mapper<Message>().map(JSONString: ErrorJson)
        //                let message = NSError(domain: "com.juliana.spotify.app", code: (error?.status)!, userInfo: ["message":error?.message])
        //                completionHandler(nil, message)
    }
}

