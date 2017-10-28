 //
//  AlbumTableViewCell.swift
//  SpotifyApp
//
//  Created by Juliana Loaiza Labrador on 27/10/17.
//  Copyright © 2017 Juliana Loaiza Labrador. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {
    
    @IBOutlet weak var flagLbl: UILabel!

    var flag:String?{
        didSet{
            flagLbl.text = "\(String(describing: flag!)) \(String(describing: flag!.flag()))"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


