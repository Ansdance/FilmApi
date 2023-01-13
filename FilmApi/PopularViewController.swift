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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.popularCollectionView.delegate = self
        self.popularCollectionView.dataSource = self
                //Register cell
        self.popularCollectionView.register(UINib(nibName: "PopularViewController", bundle: nil), forCellWithReuseIdentifier: "PopularViewController")
                //
        searchFilms(query: 1)
            }
        
    private func searchFilms(query: any Numeric){
                                   let parameters = ["api_key": "Ы",
                                                     "language" : "ru-RU",
                                                     "page" : query ,
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
                searchFilms(query: 1)
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
//        let card = popularArray[indexPath.row]
//        cell.popularLabelCell.text = popularArray[indexPath.row].title
//        cell.popularImageCell.image = UIImage(named: popularArray[indexPath.row].poster_path)
        cell.setData(film: popularArray[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
          print("Index Path \(indexPath)")
    }
}
    

//    @IBOutlet private weak var popularSearchBar: UISearchBar!
//
//    @IBOutlet private weak var popularTableView: UITableView!
//
//    private var popularArray : [EntityPopular] = []
//
//    private let url = "https://api.themoviedb.org/3/search/movie?"
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.popularTableView.delegate = self
//        self.popularTableView.dataSource = self
//        self.popularTableView.rowHeight = UITableView.automaticDimension
//        self.popularTableView.estimatedRowHeight = 44
//
//        //Register cell
//        self.popularTableView.register(UINib(nibName: "PopularViewController", bundle: nil), forCellReuseIdentifier: "PopularViewController")
//        self.popularSearchBar.delegate = self
//        popularSearchBar.placeholder = "Search films"
//        //
//        searchFilms()
//    }
//
//    private func searchFilms(){
//                           let parameters = ["api_key": "7de5f8b7cc960d1fb3bd9603ed5accf1",
//                                             "language" : "ru-RU",
//                                             "page" : 1,
//                                             "region": "ru"
//                                             ] as [String : Any]
//                           AF.request("https://api.themoviedb.org/3/movie/popular?", method: .get,
//                   parameters: parameters).responseData {
//            responce in
//            var resultString = ""
//            if let data = responce.data {
//                resultString = String(data: data, encoding: .utf8)!
//                print(resultString)
//            }
//            if responce.response?.statusCode == 200 {
//                let json = JSON(responce.data!)
//
//                if let array = json["results"].array {
//                    for item in array {
//                        let film = EntityPopular(json: item)
//                        self.popularArray.append(film)
//                    }
//                }
//                self.popularTableView.reloadData()
//            }
//        }
//    }
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        popularArray.removeAll()
//        popularTableView.reloadData()
//        searchFilms()
//    }
//}
//
//extension PopularViewController: UITableViewDelegate {
//
//}
//
//
//extension PopularViewController: UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return self.popularArray.count
//    }
//
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if let cell =  tableView.dequeueReusableCell(withIdentifier: "CellPopular", for: indexPath) as? PopularTableViewCell {
//
//            // Configure the cell...
//            cell.setData(film: popularArray[indexPath.row])
//
//                return cell
//    }
//            return UITableViewCell()
//}
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 179
//    }
//}

