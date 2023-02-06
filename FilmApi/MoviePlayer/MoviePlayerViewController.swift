//
//  MoviePlayerViewController.swift
//  FilmApi
//
//  Created by ANSAR DAULETBAYEV on 03.02.2023.
//

import UIKit
import YouTubePlayer

class MoviePlayerViewController: UIViewController {
    @IBOutlet weak var player: YouTubePlayerView!
    
    @IBOutlet weak var label: UILabel!
    var video_link = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = video_link

        // Do any additional setup after loading the view.
        
        player.loadVideoID(video_link)
    }

}

