//
//  TabBarViewController.swift
//  Assignment2-1
//
//  Created by Takafumi Watanabe on 2021-10-28.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = HomeViewController()
        
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "homeTab"), tag: 0)
        
        let profileVC = ProfileViewController()
        
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profileTab"), tag: 1)
        
        let friendsVC = FriendsViewController()
        
        friendsVC.tabBarItem = UITabBarItem(title: "Friends", image: UIImage(named: "friendsTab"), tag: 2)
        
        tabBar.backgroundColor = UIColor(hexString:  "#F9F9F9")
        tabBar.tintColor = UIColor(hexString: "#58CFC2")
        
        viewControllers = [homeVC, profileVC, friendsVC]
        
        // for test purpose
        Networking.sampleApi()
    }
}
