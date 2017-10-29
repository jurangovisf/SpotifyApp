//
//  OpenSpotifyViewController.swift
//  SpotifyApp
//
//  Created by Juliana Loaiza Labrador on 27/10/17.
//  Copyright © 2017 Juliana Loaiza Labrador. All rights reserved.
//

import UIKit

class OpenSpotifyViewController: UIViewController {
    
    @IBOutlet weak var albumImage: UIImageView!
    
    var album:Album?
    
    @IBAction func OpenSpotify(_ sender: UIButton) {
        if let url = URL(string: (album?.externalsURL)!){
            UIApplication.shared.openURL(url)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !((album?.images?.isEmpty)!){
            albumImage.downloadedFrom(url: URL(string: album!.images!.first!.url!)!)
        }
    }
    
    @IBAction func closePopup(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
