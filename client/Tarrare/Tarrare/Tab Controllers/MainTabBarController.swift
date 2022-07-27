//
//  MainTabBarController.swift
//  Tarrare
//
//  Created by Rashad Philizaire on 7/8/22.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startMatchListener()
        view.backgroundColor = .white
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let homeIcon = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        homeVC.tabBarItem = homeIcon
        
        let messagesVC = UINavigationController(rootViewController: ConversationsViewController())
        let messageIcon = UITabBarItem(title: "Messages", image: UIImage(systemName: "bubble.left"), selectedImage: UIImage(systemName: "bubble.left.fill"))
        messagesVC.tabBarItem = messageIcon
        
        let profileVC = UINavigationController(rootViewController: ProfileViewController())
        let profileIcon = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        profileVC.tabBarItem = profileIcon
        
        self.viewControllers = [homeVC, messagesVC, profileVC]
        self.tabBar.tintColor = .black
        self.tabBar.unselectedItemTintColor = .darkGray
    }
    
    // MARK: - GraphQL App Lifetime Subscriptions
    
    func startMatchListener() {
        Match.newMatchListen { newMatch in
            guard let match = newMatch else { return }
            guard let currentDelivery = Delivery.userCurrent else { return }
            
            if match.delivery == currentDelivery {
                let newOfferVC = NewOfferViewController()
                newOfferVC.match = newMatch
                self.present(UINavigationController(rootViewController: newOfferVC), animated: true)
            }
        }
    }
    
}
