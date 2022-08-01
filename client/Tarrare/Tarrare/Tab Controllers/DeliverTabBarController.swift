//
//  DeliverTabBarController.swift
//  Tarrare
//
//  Created by Rashad Philizaire on 7/29/22.
//

import Foundation
import UIKit

class DeliverTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let deliverVC = UINavigationController(rootViewController: DeliverScreenViewController())
        
        let deliverIcon = UITabBarItem(title: "Deliver", image: UIImage(systemName: "figure.walk"), selectedImage: UIImage(named: "figure.walk.motion"))
        deliverVC.tabBarItem = deliverIcon
        
        let messagesVC = UINavigationController(rootViewController: ConversationsViewController())
        let messageIcon = UITabBarItem(title: "Messages", image: UIImage(systemName: "bubble.left"), selectedImage: UIImage(systemName: "bubble.left.fill"))
        messagesVC.tabBarItem = messageIcon
        
        let profileVC = UINavigationController(rootViewController: DeliverProfileViewController())
        let profileIcon = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        profileVC.tabBarItem = profileIcon
        
        self.viewControllers = [deliverVC, messagesVC, profileVC]
        self.tabBar.tintColor = .black
        self.tabBar.unselectedItemTintColor = .darkGray
    }
}
