//
//  ArtistRepository.swift
//  SpotifyApp
//
//  Created by Juliana Loaiza Labrador on 27/10/17.
//  Copyright © 2017 Juliana Loaiza Labrador. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

private let sharedInstance = ArtistRepository()

class ArtistRepository: IArtistRepository{
    
    static let sharedInstance = ArtistRepository()
    
    class var sharedDispatchInstance: ArtistRepository {
        struct Static {
            static var onceToken = NSUUID().uuidString
            static var instance: ArtistRepository? = nil
        }
        DispatchQueue.once(token: Static.onceToken) {
            Static.instance = ArtistRepository()
        }
        return Static.instance!
    }
    
    class var sharedStructInstance: ArtistRepository {
        struct Static {
            static let instance = ArtistRepository()
        }
        return Static.instance
    }
    
    func getArtist(_ artistName: String?, completionHandler: @escaping ([Artist]?, NSError?) -> Void) {
        let header = ["Authorization": TOKEN]
        let parameters = ["q":artistName!, "type":"artist"]
        Alamofire.request("\(BASE_URI)search", method: HTTPMethod.get, parameters: parameters, encoding: URLEncoding.queryString, headers: header).validate().responseJSON {
            (response: DataResponse<Any>) in
            switch(response.result) {
            case .success(let valueJson):
      
                if let jsonDictionary = valueJson as? NSDictionary {
                    if let artistsJson =  jsonDictionary.value(forKey: "artists") as? NSDictionary {
                        let artists =  Mapper<Artist>().mapArray(JSONObject: artistsJson["items"])
                        completionHandler(artists, nil)
                    }
                }
                break
            case .failure(let error):
                completionHandler(nil, nil)
                break
            }
    }
}
    
 
    func getAlbums(_ id: String?, completionHandler: @escaping ([Album]?, NSError?) -> Void) {
        let header = ["Authorization": TOKEN]
        Alamofire.request("\(BASE_URI)artists/\(id!)/albums", method: HTTPMethod.get, parameters: nil, encoding: URLEncoding.queryString, headers: header).validate().responseJSON {
            (response: DataResponse<Any>) in
            switch(response.result) {
            case .success(let valueJson):
                
                if let jsonDictionary = valueJson as? NSDictionary {
                        let albums =  Mapper<Album>().mapArray(JSONObject: jsonDictionary["items"])
                        completionHandler(albums, nil)
                }
                break
            case .failure(let error):
                completionHandler(nil, nil)
                break
            }
        }
    }
}
