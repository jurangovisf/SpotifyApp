//
//  Message.swift
//  SpotifyApp
//
//  Created by Juliana Loaiza Labrador on 29/10/17.
//  Copyright © 2017 Juliana Loaiza Labrador. All rights reserved.
//

import Foundation
import ObjectMapper

class Message:Mappable{
    var status: Int?
    var message: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        status <- map["error.status"]
        message <- map["error.message"]
    }
    
}
