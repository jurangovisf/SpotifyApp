//
//  IArtistRepository.swift
//  SpotifyApp
//
//  Created by Juliana Loaiza Labrador on 27/10/17.
//  Copyright © 2017 Juliana Loaiza Labrador. All rights reserved.
//

import Foundation

protocol IArtistRepository {
    func getArtist(_ artistName: String?, token: String? ,completionHandler:@escaping (_ artists: [Artist]?, _ error: NSError?) -> Void)
    func getAlbums(_ id: String?,token: String?,completionHandler:@escaping (_ albums: [Album]?, _ error: NSError?) -> Void)}

