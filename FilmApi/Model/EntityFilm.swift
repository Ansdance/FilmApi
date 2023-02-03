//
//  EntityFilms.swift
//  FilmApi
//
//  Created by ANSAR DAULETBAYEV on 31.10.2022.
//

import Foundation
import SwiftyJSON

struct EntityFilm {
    
    var title = ""
    var poster_path = ""
    var overview = ""
    var vote_average = ""
    
    init(){
        
    }
    
    init(json: JSON){
        if let item = json["title"].string {
            title = item
        }
        if let item = json["poster_path"].string {
            poster_path = "https://image.tmdb.org/t/p/w500" + item
        }
        if let item = json["overview"].string {
            overview = item
        }
        if let item = json["vote_average"].string {
            vote_average = item
        }
        
    }
}

