//
//  ViewController.swift
//  SpotifyApp
//
//  Created by Juliana Loaiza Labrador on 27/10/17.
//  Copyright © 2017 Juliana Loaiza Labrador. All rights reserved.
//

import UIKit

class ArtistViewController: UIViewController {
    
    let repository = RepositoryLocator.sharedInstance.artistRepository()
    var albums:[Album]?
    
    @IBOutlet weak var artistsTableView: UITableView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var popularityLbl: UILabel!
    @IBOutlet weak var followersLbl: UILabel!
    @IBOutlet weak var artistImage: UIImageView!
    
    
    var artist:Artist?{
        didSet{
            setupArtistProfileValues()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        repository.getArtist("Muse") { (_ artists:[Artist]?, _ error:NSError?) in
//        print(artists)
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupArtistProfileValues(){
        if let profileArtist = self.artist {
            nameLbl.text = profileArtist.name
            popularityLbl.text = String(describing: profileArtist.popularity!)
            followersLbl.text = String(describing: profileArtist.totalFollowers!) + " Followers"
            if !((profileArtist.images?.isEmpty)!){
                artistImage.downloadedFrom(url: URL(string: profileArtist.images!.first!.url!)!)
            }
            loadAlbums()
        }
    }
    
    func loadAlbums(){
        repository.getAlbums(artist?.id) { (_ albums:[Album]?, _ error:NSError?) in
            self.albums = albums
            self.artistsTableView.reloadData()
        }
    }
    
}

extension ArtistViewController: UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.albums != nil {
            return (albums?.count)!
        } else {
            return 0
        }    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArtistTableViewCell", for: indexPath) as! ArtistTableViewCell
        cell.album = self.albums?[indexPath.row]
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        repository.getArtist(searchText) { (_ artists:[Artist]?, _ error:NSError?) in
            self.artist = artists?.first
        }
        
    }
}



