//
//  ViewController.swift
//  FilmApi
//
//  Created by ANSAR DAULETBAYEV on 31.10.2022.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

final class FilmsViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet private weak var searchbar: UISearchBar!
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var filmsArray : [EntityFilm] = []
    
    private let url = "https://api.themoviedb.org/3/search/movie?"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 44
        
        //Register cell
        self.tableView.register(UINib(nibName: "FilmsTableViewCell", bundle: nil), forCellReuseIdentifier: "FilmsTableViewCell")
        self.searchbar.delegate = self
        searchbar.placeholder = "Search films"
        //
        searchFilms(query: "Jackie Chan")
    }
    
    private func searchFilms(query: String){

        let parameters = ["api_key": "7de5f8b7cc960d1fb3bd9603ed5accf1",
                          "language" : "ru-RU",
                          "query": query,
                          "page" : 1,
                          "region": "ru",
                          "include_adult": false
        ] as [String : Any]
        AF.request("https://api.themoviedb.org/3/search/movie?", method: .get,
                   //        let parameters = ["api_key": "7de5f8b7cc960d1fb3bd9603ed5accf1",
                   //                          "language" : "ru-RU",
                   //                          "page" : 1,
                   //                          "region": "ru"
                   //                          ] as [String : Any]
                   //        AF.request("https://api.themoviedb.org/3/movie/popular?", method: .get,
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
                        let film = EntityFilm(json: item)
                        self.filmsArray.append(film)
                    }
                }
                self.tableView.reloadData()
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        filmsArray.removeAll()
        tableView.reloadData()
        searchFilms(query: searchBar.text!)
    }
}

extension FilmsViewController: UITableViewDelegate {
    
}


extension FilmsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.filmsArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell =  tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? FilmsTableViewCell {
            
            // Configure the cell...
            cell.setData(film: filmsArray[indexPath.row])
            
                return cell
    }
            return UITableViewCell()
}
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 179
    }
}

