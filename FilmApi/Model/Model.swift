//
//  Model.swift
//  FilmApi
//
//  Created by ANSAR DAULETBAYEV on 03.02.2023.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol ModelDelegate {
    func filmsFetched(_ films:[Movie])
}


class Model {
    
    var delegate:ModelDelegate?
    private var filmsArray : [Movie] = []
    
    func searchFilms(query: String, tableView: UITableView) -> [Movie]{
        
        let parameters = ["api_key": "7de5f8b7cc960d1fb3bd9603ed5accf1",
                          "language" : "ru-RU",
                          "query": query,
                          "page" : 1,
                          "region": "ru",
                          "include_adult": false
        ] as [String : Any]
        AF.request("https://api.themoviedb.org/3/search/movie?", method: .get,
                   parameters: parameters).responseData {
            responce in
            var resultString = ""
            if let data = responce.data {
                resultString = String(data: data, encoding: .utf8)!
                print(resultString)
            }
            if responce.response?.statusCode == 200 {
                let json = JSON(responce.data!)
                
                if let array = json["results"].array {
                    for item in array {
                        let film = Movie(json: item)
                        self.filmsArray.append(film)
                    }
                }
                tableView.reloadData()
                
            }
        }
        return filmsArray
    }
    
}
