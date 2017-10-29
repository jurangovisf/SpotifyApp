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
    var album:Album?
    var token:String?
    
    @IBOutlet weak var artistsTableView: UITableView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var popularityLbl: UILabel!
    @IBOutlet weak var followersLbl: UILabel!
    @IBOutlet weak var artistImage: UIImageView!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var errorLbl: UILabel!
    @IBOutlet weak var ArtistProfileHeader: UIView!
    
    var artist:Artist?{
        didSet{
            setupArtistProfileValues()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ArtistProfileHeader.layer.borderColor = UIColor.gray.cgColor
        ArtistProfileHeader.layer.borderWidth = 1
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
        }else{
            showError("Artist not found")
        }
    }
    
    func loadAlbums(){
        repository.getAlbums(artist?.id,token: self.token) { (_ albums:[Album]?, _ error:NSError?) in
            if error != nil {
                self.showError(error?.userInfo["message"] as! String)
            }else{
                self.albums = albums
                self.artistsTableView.reloadData()
            }
        }
    }
    
    func showError(_ message: String){
        ArtistProfileHeader.isHidden = true
        artistsTableView.isHidden = true
        errorView.isHidden = false
        errorLbl.text = message
    }
    
    func refreshError(){
        ArtistProfileHeader.isHidden = false
        artistsTableView.isHidden = false
        errorView.isHidden = true
    }
    
}

extension ArtistViewController: UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.albums != nil {
            return (albums?.count)!
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArtistTableViewCell", for: indexPath) as! ArtistTableViewCell
        cell.album = self.albums?[indexPath.row]
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        refreshError()
        repository.getArtist(searchText,token: self.token) { (_ artists:[Artist]?, _ error:NSError?) in
            if error != nil{
                self.showError(error?.userInfo["message"] as! String)
            }else{
                self.artist = artists?.first
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArtistTableViewCell") as! ArtistTableViewCell
        cell.layoutIfNeeded()
        cell.countriesCollectionView.layoutIfNeeded()
        let size = CGRect.init(x: 0, y: 0, width: (UIScreen.main.bounds.size.width * cell.artistCollectionViewWidth.multiplier), height: UIScreen.main.bounds.size.height)
        let collectionViewHeight = DynamicCellHeight.getHeightForCollectionView(frame: size,items: (self.albums?[indexPath.row].available_markets?.count)!)
        
        return CGFloat(collectionViewHeight + cell.countriesCollectionView.frame.minY)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        album = self.albums?[indexPath.row]
        self.performSegue(withIdentifier: "segueGoToSpotify", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! OpenSpotifyViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        destinationVC.album = self.album
        
    }
}



