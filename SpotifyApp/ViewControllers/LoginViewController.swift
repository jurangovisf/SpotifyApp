//
//  LoginViewController.swift
//  SpotifyApp
//
//  Created by Juliana Loaiza Labrador on 28/10/17.
//  Copyright © 2017 Juliana Loaiza Labrador. All rights reserved.
//

import UIKit
import OAuthSwift

class LoginViewController: UIViewController {
    
    var oauthswift: OAuthSwift?
    var token: String?
    
    @IBAction func Login(_ sender: UIButton) {
        self.doOAuthSpotify()
    }
    
    func doOAuthSpotify(){
        let oauthswift = OAuth2Swift(
            consumerKey:    CLIENT_ID,
            consumerSecret: CLIENT_SECRET,
            authorizeUrl:   "https://accounts.spotify.com/en/authorize",
            accessTokenUrl: "https://accounts.spotify.com/api/token",
            responseType:   "code"
        )
        self.oauthswift = oauthswift
        oauthswift.authorizeURLHandler = SafariURLHandler(viewController: self, oauthSwift: self.oauthswift!)
        
        let state = generateState(withLength: 20)
        
        let _ = oauthswift.authorize(
            withCallbackURL: URL(string: "SpotifyApp://callback")!,
            scope: "user-library-modify",
            state: state,
            success: { credential, response, parameters in
                self.token = parameters["access_token"] as! String
                self.performSegue(withIdentifier: "showArtistsSegue", sender: self)
        },
            failure: { error in
                print(error.description)
        }
        )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ArtistViewController
        destinationVC.token =  "Bearer " + self.token!
        
    }
    
}
