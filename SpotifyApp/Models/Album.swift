//
//  Album.swift
//  SpotifyApp
//
//  Created by Juliana Loaiza Labrador on 27/10/17.
//  Copyright © 2017 Juliana Loaiza Labrador. All rights reserved.
//

import Foundation
import ObjectMapper

class Album:Mappable{
    var id: String?
    var name: String?
    var images: [Image]?
    var available_markets:[String]?
    var externalsURL:String?
    var cellHeight: Int?{
        get{
            if !((available_markets?.isEmpty)!) {
                return FLAG_CELL_HEIGHT * (available_markets?.count)!
            }else{
                return 0
            }
        }
    }
    
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        images <- map["images"]
        available_markets <- map["available_markets"]
        externalsURL <- map["external_urls.spotify"]
    }
}
