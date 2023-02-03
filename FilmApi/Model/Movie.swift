//
//  EntityFilms.swift
//  FilmApi
//
//  Created by ANSAR DAULETBAYEV on 31.10.2022.
//

import Foundation
import SwiftyJSON

class Movie {
    
    
    var id:Int = 0
    var title:String = ""
    var poster_path:String = ""
    var overview:String = ""
    var vote_average:Float = 0.0
    var vote_count:Int = 0
//    var genre_ids:Int = 0
    
    init() {
    }
    
    init(json: JSON){
        if let item = json["id"].int {
            id = item
        }
        if let item = json["title"].string {
            title = item
        }
        if let item = json["poster_path"].string {
            poster_path = "https://image.tmdb.org/t/p/w500" + item
        }
        if let item = json["overview"].string {
            overview = item
        }
        if let item = json["vote_average"].float {
            vote_average = item
        }
        if let item = json["vote_count"].int {
            vote_count = item
        }
//        if let item = json["genre_ids"].int {
//            genre_ids = item
//        }
    }
}
