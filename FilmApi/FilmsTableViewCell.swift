//
//  FilmsTableViewCell.swift
//  FilmApi
//
//  Created by ANSAR DAULETBAYEV on 31.10.2022.
//

import UIKit
import SDWebImage

class FilmsTableViewCell: UITableViewCell {
    @IBOutlet weak var image_poster_path: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var raitingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setData(film: EntityFilms) {
        titleLabel.text = film.title
        overviewLabel.text = film.overview
        raitingLabel.text = film.vote_average
        image_poster_path.sd_setImage(with: URL(string: film.poster_path), completed: nil)
        image_poster_path.layer.cornerRadius = 55
    }

}
