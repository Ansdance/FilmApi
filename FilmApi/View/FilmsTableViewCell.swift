//
//  FilmsTableViewCell.swift
//  FilmApi
//
//  Created by ANSAR DAULETBAYEV on 03.02.2023.
//


import UIKit
import SDWebImage


class FilmsTableViewCell: UITableViewCell {

    @IBOutlet weak var imagePosterPath: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
//    @IBOutlet weak var raitingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setData(film: Movie) {
        titleLabel.text = film.title
        overviewLabel.text = film.overview
//        raitingLabel.text = film.vote_average
        imagePosterPath.sd_setImage(with: URL(string: film.poster_path), completed: nil)
        imagePosterPath.layer.cornerRadius = 30
    }
}
