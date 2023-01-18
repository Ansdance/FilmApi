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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setDataPop(film: EntityPopular) {
        popularLabelCell.text = film.title
        popularImageCell.sd_setImage(with: URL(string: film.poster_path), completed: nil)
        popularImageCell.layer.cornerRadius = 55
    }
}
