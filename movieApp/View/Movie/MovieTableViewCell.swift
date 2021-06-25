//
//  MovieTableViewCell.swift
//  movieApp
//
//  Created by batontouch on 2021/06/22.
//

import UIKit
import Cosmos

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieReleasedDate: UILabel!
    @IBOutlet weak var ratingScore: CosmosView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ratingScore.settings.updateOnTouch = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
