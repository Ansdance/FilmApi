//
//  VideoResults.swift
//  FilmApi
//
//  Created by ANSAR DAULETBAYEV on 04.02.2023.
//

import Foundation
import SwiftyJSON

class VideoResults {
    
    var id:String = ""
    var key:String = ""
    var site:String = ""
    var size:Int = 0
    var type:String = ""
    var published_at:String = ""
    //    var genre_ids:Int = 0
    
    init() {
    }
    
    init(json: JSON){
        if let item = json["id"].string {
            id = item
        }
        if let item = json["key"].string {
            key = Constants.URL_OF_YOUTUBE + item
        }
        if let item = json["site"].string {
            site = item
        }
        if let item = json["size"].int {
            size = item
        }
        if let item = json["type"].string {
            type = item
        }
        if let item = json["published_at"].string {
            published_at = item
        }
    }
}
