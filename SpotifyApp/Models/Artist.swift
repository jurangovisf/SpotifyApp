//
//  Artist.swift
//  SpotifyApp
//
//  Created by Juliana Loaiza Labrador on 27/10/17.
//  Copyright © 2017 Juliana Loaiza Labrador. All rights reserved.
//

import Foundation
import ObjectMapper

class Artist: Mappable{
    var id: String?
    var name: String?
    var images: [Image]?
    var popularity: Int?
    var totalFollowers: Int?

    required init?(map: Map) {
    }
    
    // Mappable
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        images <- map["images"]
        popularity <- map["popularity"]
        totalFollowers <- map["followers.total"]
    }
}

class Image:Mappable{
    var height: Int?
    var url: String?
    var width: Int?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        height <- map["height"]
        url <- map["url"]
        width <- map["width"]
    }
}

