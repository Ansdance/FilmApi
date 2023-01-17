//
//  EntityPopular.swift
//  FilmApi
//
//  Created by ANSAR DAULETBAYEV on 10.01.2023.
//

import Foundation
import SwiftyJSON

struct EntityPopular {
    
    var title = ""
    var poster_path = ""
//    var overview = ""
//    var vote_average = ""
    
    init(){
        
    }
    
    init(json: JSON){
        if let item = json["title"].string {
            title = item
        }
        if let item = json["poster_path"].string {
            poster_path = "https://image.tmdb.org/t/p/w500" + item
        }
//        if let item = json["overview"].string {
//            overview = item
//        }
//        if let item = json["vote_average"].string {
//            vote_average = item
//        } //
        
    }
}

