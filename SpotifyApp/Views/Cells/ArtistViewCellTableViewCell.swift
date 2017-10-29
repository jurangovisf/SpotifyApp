//
//  ArtistViewCellTableViewCell.swift
//  SpotifyApp
//
//  Created by Juliana Loaiza Labrador on 27/10/17.
//  Copyright © 2017 Juliana Loaiza Labrador. All rights reserved.
//

import UIKit

class ArtistTableViewCell: UITableViewCell {
    
    @IBOutlet weak var artistImage: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var countriesCollectionView: UICollectionView!
    @IBOutlet weak var countriesAvailable: UILabel!
    @IBOutlet weak var artistCollectionViewWidth: NSLayoutConstraint!
    
    var album:Album!{
        didSet{
            updateUI()
        }
    }
    
    func updateUI(){
        nameLbl.text = album.name
        if !((album.images?.isEmpty)!){
            artistImage.downloadedFrom(url: URL(string: album.images!.first!.url!)!, contentMode: UIViewContentMode.scaleToFill)
        }
        if album.available_markets!.count > 5{
            countriesAvailable.text = "Available in more than five countries"
        }else{
            countriesAvailable.text = "Available in less than five countries"
        }
        countriesCollectionView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.countriesCollectionView.delegate = self
        self.countriesCollectionView.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
extension ArtistTableViewCell: UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.album != nil && self.album.available_markets != nil {
            return (album.available_markets!.count)
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "countriesViewCell", for: indexPath) as! CountriesCollectionViewCell
        cell.flag = self.album.available_markets?[indexPath.row]
        return cell
    }
    
}


