//
//  Video.swift
//  FilmApi
//
//  Created by ANSAR DAULETBAYEV on 03.02.2023.
//

import Foundation
import SwiftyJSON

class Video {
    
    var id:Int = 0
    var results: [VideoResult] = []
   
    
    init() {
    }
    
    init(json: JSON){
        if let temp = json["id"].int {
            self.id = temp
        }
        
        if let array = json["results"].array {
            for item in array {
                let temp = VideoResult(json: item)
                self.results.append(temp)
            }
        }
//        if let item = json["genre_ids"].int {
//            genre_ids = item
//        }
        
        // if json["poster"].exist()  {
        // if let temp = json ["poster"] ["link"].string {
        // self.poster_link = temp
        // }
        
        
        /*
         
         public var genres: [Genre] = []
         if let array = json["genres"].array {
         for item in array {
         let temp = Genre(json: item)
         self.genres.append(temp)
         */
        
    }
}

