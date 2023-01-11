//
//  FilmsTableViewController.swift
//  FilmApi
//
//  Created by ANSAR DAULETBAYEV on 31.10.2022.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

class FilmsTableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchbar: UISearchBar!
    
    
    var filmsArray : [EntityFilm] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        searchbar.delegate = self

        searchbar.placeholder = "Search films"
//
        searchFilms(query: "Jackie Chan")
    }
    
    func searchFilms(query: String) {
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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filmsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FilmsTableViewCell

        // Configure the cell...
        cell.setData(film: filmsArray[indexPath.row])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 179
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
