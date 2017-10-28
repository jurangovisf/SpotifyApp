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
    @IBOutlet weak var countriesTableView: UITableView!
    
    var album:Album!{
        didSet{
            updateUI()
        }
    }
    
    func updateUI(){
        nameLbl.text = album.name
        if !((album.images?.isEmpty)!){
            artistImage.downloadedFrom(url: URL(string: album.images!.first!.url!)!)
        }

    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        countriesTableView.delegate = self
        countriesTableView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension ArtistTableViewCell: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.album != nil && self.album.available_markets != nil {
            return (album.available_markets!.count)
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumViewCell", for: indexPath) as! AlbumTableViewCell
        cell.flag = self.album.available_markets?[indexPath.row]
        return cell
    }
    
}


