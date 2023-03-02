//
//  ViewController.swift
//  FilmApi
//
//  Created by ANSAR DAULETBAYEV on 31.10.2022.
//

import UIKit
import Alamofire
import SwiftyJSON
//import SVProgressHUD

final class FilmsViewController: UIViewController, UISearchBarDelegate, ModelDelegate {
    
    @IBOutlet private weak var searchbar: UISearchBar!
    
    @IBOutlet private weak var tableView: UITableView!
    
    var model = Model()
    
    private var filmsArray : [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 44
        
        //Register cell
        self.tableView.register(UINib(nibName: "FilmsTableViewCell", bundle: nil), forCellReuseIdentifier: "FilmsTableViewCell")
        self.searchbar.delegate = self
        //        configureViews()
        searchbar.placeholder = "Search films"
        
        
        searchFilms(query: Constants.NAME_OF_SEARCHING_FIRST)
        //        let dataS = model.searchFilms(query: "Jackie Chan", tableView: tableView)
        //        self.filmsArray = dataS
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        let selectedCell = filmsArray[tableView.indexPathForSelectedRow!.row]
        
        let detailVC = segue.destination as! MovieInfoViewController
        
        detailVC.movie = selectedCell
    }
    
    func filmsFetched(_ films: [Movie]) {
        self.filmsArray = films
        
        // Refresh the tableview
        tableView.reloadData()
    }
    
    private func searchFilms(query: String){
        //        SVProgressHUD.show()
        
        let parameters = ["api_key": Constants.API_KEY,
                          "language" : "ru-RU",
                          "query": query,
                          "page" : 1,
                          "region": "ru",
                          "include_adult": false
        ] as [String : Any]
        AF.request(Constants.URL_MOVIE, method: .get,
                   parameters: parameters).responseData {
            responce in
            
            //            SVProgressHUD.dismiss()
            //            do {
            var resultString = ""
            if let data = responce.data {
                resultString = String(data: data, encoding: .utf8)!
                //                print(resultString)
            }
            if responce.response?.statusCode == 200 {
                let json = JSON(responce.data!)
                
                if let array = json["results"].array {
                    for item in array {
                        let film = Movie(json: item)
                        self.filmsArray.append(film)
                    }
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        filmsArray.removeAll()
        tableView.reloadData()
        //        model.searchFilms(query: searchBar.text!, tableView: tableView)
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
        if let cell =  tableView.dequeueReusableCell(withIdentifier: "FilmCell", for: indexPath) as? FilmsTableViewCell {
            
            // Configure the cell...
            cell.setData(film: filmsArray[indexPath.row])
            
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 153
    }
}

