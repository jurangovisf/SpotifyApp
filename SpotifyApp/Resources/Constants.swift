//
//  Constants.swift
//  SpotifyApp
//
//  Created by Juliana Loaiza Labrador on 27/10/17.
//  Copyright © 2017 Juliana Loaiza Labrador. All rights reserved.
//

import Foundation
import UIKit

public let BASE_URI = BASE_URI_DEV
let BASE_URI_DEV = "https://api.spotify.com/v1/"
//let TOKEN = "Bearer BQB6nBH9lL9BJZRK6Opbn2rsJ33Teh58Eelul0maUqhej7AAbyet0kdYhQuSywM2o9KzFPphZDCSVOKyF2fonK4gRxBCgnWuRZJGII3wdplJPKp3M4JmicZ9TQUzf1hkldHTeu5Y8ISzAHlu"
let FLAG_CELL_HEIGHT = 44
let CLIENT_ID = "7a9313a6f1cc4b5cb4e163c53674ed67"
let CLIENT_SECRET = "40f3ae1579f5460cabcac5746fb14d7b"

let ERROR_CAN_NOT_CONNECT_TO_HOST_CODE = -1004
let ERROR_NETWORK_CONNECTION_LOST_CODE = -1005
let ERROR_REQUEST_TIMEOUT_CODE = -1001
let ERROR_NO_INTERNET_CONNECTION_CODE = -1009
public let ERROR_BAD_REQUEST_CODE = 400
public let ERROR_UNAUTHORIZED_CODE = 401
public let ERROR_FORBIDDEN_CODE = 403
public let ERROR_NOT_FOUND = 404

public let IS_IPAD = UIDevice.current.userInterfaceIdiom == .pad
public let IS_IPHONE = UIDevice.current.userInterfaceIdiom == .phone
let IS_RETINA = UIScreen.main.scale >= 2.0

public let SCREEN_WIDTH = UIScreen.main.bounds.size.width
public let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
public let SCREEN_MAX_LENGTH = max(SCREEN_WIDTH, SCREEN_HEIGHT)
public let SCREEN_MIN_LENGTH = min(SCREEN_WIDTH, SCREEN_HEIGHT)

public let IS_IPHONE_4_OR_LESS = (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
public let IS_IPHONE_5 = (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
public let IS_IPHONE_6 = (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
public let IS_IPHONE_6P = (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
