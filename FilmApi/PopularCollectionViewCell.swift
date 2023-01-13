//
//  PopularCollectionViewCell.swift
//  FilmApi
//
//  Created by ANSAR DAULETBAYEV on 13.01.2023.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var popularImageCell: UIImageView!
    @IBOutlet weak var popularLabelCell: UILabel!
    
//    var popular: EntityPopular?
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//    
//    func setCard(_ card:Card){
//        // Keep track of the card that gets passed in
//        frontImageView.image = UIImage(named: EntityPopular.self)
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//    func setData(film: EntityFilm) {
//        popularLabelCell.text = film.title
//        popularImageCell.sd_setImage(with: URL(string: film.poster_path), completed: nil)
//        popularImageCell.layer.cornerRadius = 55
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setData(film: EntityFilm) {
        popularLabelCell.text = film.title
        popularImageCell.sd_setImage(with: URL(string: film.poster_path), completed: nil)
        popularImageCell.layer.cornerRadius = 55
    }
}
