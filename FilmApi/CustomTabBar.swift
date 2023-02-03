//
//  CustomTabBar.swift
//  FilmApi
//
//  Created by ANSAR DAULETBAYEV on 18.01.2023.
//

import Foundation
import UIKit

class CustomTabBar: UITabBarController, UITabBarControllerDelegate {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.selectedIndex = 1
        setupMiddleButton()
    }
    func setupMiddleButton(){
        let middleButton = UIButton(frame:  CGRect(x: (self.view.bounds.width / 2) - 25, y: -20 , width: 60, height: 60))
 
        middleButton.setBackgroundImage(UIImage(named: "Home_selected"), for: .normal)
        middleButton.layer.shadowColor = UIColor.black.cgColor
        middleButton.layer.shadowOpacity = 0.1
        middleButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        
        self.tabBar.addSubview(middleButton)
        middleButton.addTarget(self, action: #selector(menuButtonAction), for: .touchUpInside)
        self.view.layoutIfNeeded()
    }
    @objc func menuButtonAction(sender:UIButton) {
        self.selectedIndex = 1
    }
    
//    func setTabImages() {
//            let homeselectedimage = UIImage(named: "Home_selected")!.withRenderingMode(.alwaysOriginal)
//
//            let searchselectedimage = UIImage(named: "Search_selected")!.withRenderingMode(.alwaysOriginal)
//
//            let favoriteselectedimage = UIImage(named: "Favorite_selected")!.withRenderingMode(.alwaysOriginal)
//
//            let profileselectedimage = UIImage(named: "Profile_selected")!.withRenderingMode(.alwaysOriginal)
//
//            tabBar.items?[0].selectedImage = homeselectedimage
//            tabBar.items?[1].selectedImage = searchselectedimage
//            tabBar.items?[2].selectedImage = favoriteselectedimage
//            tabBar.items?[3].selectedImage = profileselectedimage
//        }
}
