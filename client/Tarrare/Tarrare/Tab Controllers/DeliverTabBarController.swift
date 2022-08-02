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
        self.startMatchListener()
        self.startMessageListener()
        
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
    
    
    // MARK: - Lifetime GraphQL Subscriptions
    
    func startMatchListener() {
        Match.newMatchListen { newMatch in
            guard let match = newMatch else { return }
            guard let currentDelivery = Delivery.userCurrent else { return }
            
            if match.delivery == currentDelivery {
                let newOfferVC = NewOfferViewController()
                newOfferVC.match = newMatch
                
                let navController = UINavigationController(rootViewController: newOfferVC)
                navController.modalPresentationStyle = .fullScreen
                self.present(navController, animated: true)
            }
        }
    }
    
    func startMessageListener() {
        guard let currentUser = User.getCurrent() else { return }
        
        Message.messageListenForUserId(currentUser.id, completion: {newMessage in
            guard let newMessage = newMessage else { return }
            
            let notification = ChatNotification()
            notification.message = newMessage
            notification.display()
        })
    }
    
}
