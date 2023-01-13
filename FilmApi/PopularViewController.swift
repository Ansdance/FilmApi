//
//  PopularViewController.swift
//  FilmApi
//
//  Created by ANSAR DAULETBAYEV on 10.01.2023.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

class PopularViewController: UIViewController, UISearchBarDelegate, UICollectionViewDelegate {
    
    @IBOutlet var popularCollectionView: UICollectionView!
    
    private var popularArray : [EntityPopular] = []
    var current_page = 1
    var total_page = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.popularCollectionView.delegate = self
        self.popularCollectionView.dataSource = self
                //Register cell
        self.popularCollectionView.register(UINib(nibName: "PopularViewController", bundle: nil), forCellWithReuseIdentifier: "PopularViewController")
                //
        searchFilms(page: 1)
            }
        
    private func searchFilms(page: Int){
                                   let parameters = ["api_key": "7de5f8b7cc960d1fb3bd9603ed5accf1",
                                                     "language" : "ru-RU",
                                                     "page" : page ,
                                                     "region": "ru"
                                                     ] as [String : Any]
                                   AF.request("https://api.themoviedb.org/3/movie/popular?", method: .get,
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
                                let film = EntityPopular(json: item)
                                self.popularArray.append(film)
                            }
                        }
                        self.popularCollectionView.reloadData()
                    }
                }
            }
        
            func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
                popularArray.removeAll()
                popularCollectionView.reloadData()
                searchFilms(page: 1)
            }
}


extension PopularViewController: UICollectionViewDataSource {
    
    private func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.popularArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! PopularCollectionViewCell
        cell.setDataPop(film: popularArray[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if current_page < total_page && indexPath.row == popularArray.count - 1 {
            current_page = current_page + 1
            searchFilms(page: current_page)
        }
    }
    
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 179
        }
}


