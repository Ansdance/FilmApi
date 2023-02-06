//
//  MovieInfoViewController.swift
//  FilmApi
//
//  Created by ANSAR DAULETBAYEV on 03.02.2023.
//

import UIKit
import SDWebImage
import SVProgressHUD
import SwiftyJSON
import Alamofire

class MovieInfoViewController: UIViewController {
    
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var voteAverage: UILabel!
    @IBOutlet weak var voteCount: UILabel!

    var movie = Movie()
//    var video : [Video] = []
    private var videoResults: [VideoResult] = []
    var keyURL: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameLabel.text = ""
        detailLabel.text = ""
        descriptionLabel.text = ""
        voteAverage.text = ""
        voteCount.text = ""
        
        nameLabel.text = movie.title
        detailLabel.text = String(movie.id)
        descriptionLabel.text = movie.overview
        posterImageView.sd_setImage(with: URL(string: movie.poster_path), completed: nil)
        voteAverage.text = String(movie.vote_average)
        voteCount.text = String(movie.vote_count)
        downloadVideo()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func configureViews() {
        //backgroundView
        backgroundView.layer.cornerRadius = 32
        backgroundView.clipsToBounds = true
        backgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//        descriptionLabel.numberOfLines = 4
    }
    
    func setData() {
        posterImageView.sd_setImage(with: URL(string: movie.poster_path), completed: nil)
        nameLabel.text = movie.title
        descriptionLabel.text = movie.overview
        
    }
    
    func downloadVideo() {

        let parameters = ["api_key": Constants.API_KEY,
                          "language" : "en-US"
        ] as [String : Any]
        print(String(Constants.URL_OF_VIDEO + String(movie.id)) + Constants.ADD_TO_VIDEO)
        AF.request(Constants.URL_OF_VIDEO + String(movie.id) + Constants.ADD_TO_VIDEO, method: .get,
                   parameters: parameters).responseData {
            responce in
            var resultString = ""
            if let data = responce.data {
                resultString = String(data: data, encoding: .utf8)!
            }
            if responce.response?.statusCode == 200 {
                let json = JSON(responce.data!)
                if let array = json["results"].array {
                    for item in array {
                        let filmVideo = VideoResult (json: item)
                        self.videoResults.append(filmVideo)
//                        for tt in self.vResult {
//                            if self.keyURL == "" {
//                                self.keyURL.append(tt.key)
//                            }
//                        }
                    }

                }
            }
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        //dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func playMovie(_ sender: Any) {
        
        let playerVC = storyboard?.instantiateViewController(withIdentifier: "MoviePlayerViewController") as! MoviePlayerViewController
        if let videoUrl = self.videoResults.first {
            playerVC.video_link = videoUrl.key
            navigationController?.show(playerVC, sender: self)
        }
//        playerVC.video_link = keyURL
        
    }

}



