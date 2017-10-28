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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
