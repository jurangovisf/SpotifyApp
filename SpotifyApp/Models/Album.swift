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
    
    required init?(map: Map) {
    }
    
    // Mappable
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        images <- map["images"]
        available_markets <- map["available_markets"]
    }
    
}
