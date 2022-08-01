//
//  OrderTabBarController.swift
//  Tarrare
//
//  Created by Rashad Philizaire on 7/29/22.
//

import Foundation
import UIKit

class OrderTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let orderVC = UINavigationController(rootViewController: OrderScreenRestaurantsViewController())
        
        let orderIcon = UITabBarItem(title: "Order", image: UIImage(systemName: "takeoutbag.and.cup.and.straw"), selectedImage: UIImage(systemName: "takeoutbag.and.cup.and.straw.fill"))
        orderVC.tabBarItem = orderIcon
        
        let messagesVC = UINavigationController(rootViewController: ConversationsViewController())
        let messageIcon = UITabBarItem(title: "Messages", image: UIImage(systemName: "bubble.left"), selectedImage: UIImage(systemName: "bubble.left.fill"))
        messagesVC.tabBarItem = messageIcon
        
        let profileVC = UINavigationController(rootViewController: OrderProfileViewController())
        let profileIcon = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        profileVC.tabBarItem = profileIcon
        
        self.viewControllers = [orderVC, messagesVC, profileVC]
        self.tabBar.tintColor = .black
        self.tabBar.unselectedItemTintColor = .darkGray
    }
    
}

